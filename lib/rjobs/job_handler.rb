require 'rjobs/command_builder'
require 'rjobs/process'
require 'rjobs/job'

module Rjobs
  class JobHandler
    @@host = "127.0.0.1"
    @@password = "xgrid"

    def self.get_job_attributes(id)
      cb = Rjobs::CommandBuilder.new("xgrid", {
        :h => host,
        :p => password,
        :f => "xml",
        :job => :attributes,
        :id => id
      })      
      # puts cb.build
      Rjobs::Process.run(cb.build)
    end

    def self.submit_job(job)
      cb = Rjobs::CommandBuilder.new("xgrid", {
        :h => host,
        :p => password,
        :f => "xml",
        :job => :submit        
      })      
      cmd = cb.build << " " << job.command
      puts cmd

      result = Rjobs::Process.run(cmd)
      
      result = Plist::parse_xml(result)

      job.id = result['jobIdentifier'].nil? ? -1 : Integer(result['jobIdentifier'])
    end

    def self.get_job_results(job, separate_output)
      params = {
        :h => host,
        :p => password,
        :f => "xml",
        :job => :results,
        :id => job.id        
      }
      if separate_output
        if job.status == "Finished"
          params[:so] = job.name+".out"
          puts "#{job.name} --> #{params[:so]}"
        else
          params[:se] = job.name+".err"
          puts "#{job.name} --> #{params[:se]}".red
        end        
      end
      cb = Rjobs::CommandBuilder.new("xgrid", params)      
      Rjobs::Process.run(cb.build)
    end

    def self.host
      @@host
    end

    def self.host=(value)
      @@host = value
    end

    def self.password      
      @@password
    end

    def self.password=(value)
      @@password = value
    end



  end
end
