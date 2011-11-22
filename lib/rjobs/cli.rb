require 'thor'
#require 'rcp_gen'
require 'rjobs/jobs_file'
require 'rjobs/job_input_file'
require 'rjobs/job_handler'
require 'rjobs/job'
require 'colorize'

module Rjobs
  class CLI < Thor
    desc "help", "Display the manual of Rjobs"
    def help
      puts "Hello there!!! This is the manual pages."
    end

    desc "submit [jobs_input_file]", "Submit jobfiles into grid"
    def submit(jobs_input_file = "")
      if (jobs_input_file=="")
        return man(:submit)        
      end      
      jif = JobInputFile.new(jobs_input_file)
      jobs = []
      (jif.jobIdFrom .. jif.jobIdTo).each do |id| 
        j = Rjobs::Job.new()
        j.name = jif.jobName + id
        j.command = jif.command
        jobs << j        
      end

      jobs.each do |job|        
        Rjobs::JobHandler.submit_job(job)        
      end

      jf = JobsFile.new()
      jf.write(jif.jobName+".rjobs",jobs)

      puts "#{jobs.count} job(s) submited.".green
    end

    desc "status jobs_file","list all jobs contained in the jobs_file"
    def status(jobs_file="")
      jf = JobsFile.new(jobs_file)
      jobs= []
      jf.ids.each do |jobId|
        job = Rjobs::Job.new(jobId, Rjobs::JobHandler.get_job_attributes(jobId))
        jobs << job
      end

      jobs.each do |job|
        puts "#{job.id} - #{job.status.red}"
      end

    end

    desc "havest jobs_file", "retrieve all the results of the jobs" 
    def havest(jobs_file="")
      jf = Rjobs::JobsFile.new(jobs_file)

      jf.ids.each do |jobId|
        puts Rjobs::JobHandler.get_job_attributes(jobId)
      end       
    end


    private
    def man(command)
      if (command==:submit )
        puts "rjobs submit [jobs_file]"
      end
    end
  end
end 
