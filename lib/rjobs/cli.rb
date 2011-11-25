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
      length = jif.jobIdTo.length
      (jif.jobIdFrom .. jif.jobIdTo).each do |id| 
        j = Rjobs::Job.new()
        j.name = "%s%0#{length}d" % [jif.jobName,id]
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
      jobs = get_jobs_info(jobs_file)

      jobs.each do |job|        
        puts "#{job.name} - #{job.status_with_color}"
      end

    end

    desc "harvest jobs_file", "retrieve all the results of the jobs" 
    def harvest(jobs_file="")
      if (jobs_file=="")
        return man(:harvest)        
      end       

      jobs = get_jobs_info(jobs_file)
      jobs.each do |job| 
        Rjobs::JobHandler.get_job_results(job)        
      end        
    end


    private
    def man(command)
      case command
      when :submit      
        puts "rjobs submit [jobs_file]"
      when :harvest
        puts "rjobs harvest [jobs_file]"
      end
    end

    def get_jobs_info(jobs_file)
      jf = JobsFile.new(jobs_file)
      jobs= []
      jf.ids.each_with_index do |jobId,index|
        job = Rjobs::Job.new(jobId, Rjobs::JobHandler.get_job_attributes(jobId))
        job.name = jf.job_names[index]
        jobs << job
      end
      jobs
    end

  end
end 
