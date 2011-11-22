require 'rjobs/command_builder'
require 'rjobs/process'
require 'rjobs/job'

module Rjobs
  class JobHandler
    @@host = "127.0.0.1"
    @@password = "xgrid"

    def self.get_job_attributes(id)
      cb = Rjobs::CommandBuilder.new("xgrid", {
        :h => @@host,
        :p => @@password,
        :f => "xml",
        :job => :attributes,
        :id => id
      })      
      Rjobs::Process.run(cb.build)
    end

    def self.submit_job(job)
      cb = Rjobs::CommandBuilder.new("xgrid", {
        :h => @@host,
        :p => @@password,
        :f => "xml",
        :job => :submit        
      })      
      cmd = cb.build << " " << job.command
      result = Rjobs::Process.run(cmd)
      
      result = Plist::parse_xml(result)

      job.id = result['jobIdentifier'].nil? ? -1 : Integer(result['jobIdentifier'])
    end

  end
end
