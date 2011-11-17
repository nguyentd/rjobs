require 'thor'
#require 'rcp_gen'
require 'rjobs/jobs_file'
require 'rjobs/job_handler'
require 'rjobs/job'
require 'rjobs/color_helper'

module Rjobs
  class CLI < Thor
    desc "help", "Display the manual of Rjobs"
    def help
      puts "Hello there!!! This is the manual pages."
    end

    desc "submit [jobs_file]", "Submit jobfiles into grid"
    def submit(jobs_file = "")
      if (jobs_file=="")
        man(:submit)
        return
      end
      puts "Hello world"      

    end

    desc "list jobs_file","list all jobs contained in the jobs_file"
    def list(jobs_file="")
      jf = JobsFile.new(jobs_file)

      @jobs= []
      jf.ids.each do |jobId|
        job = Job.new(jobId, Rjobs::JobHandler.get_job_attributes(jobId))
        @jobs << job
      end

      @jobs.each do |job|
        puts "#{job.id} - #{job.status.red}"
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
