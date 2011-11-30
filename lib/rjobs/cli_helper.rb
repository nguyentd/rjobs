require "trollop"

module Rjobs
  module CliHelper
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

    def parser(banner_string)
      default_hostname = ENV['XGRID_CONTROLLER_HOSTNAME'].nil? ? "127.0.0.1" : ENV['XGRID_CONTROLLER_HOSTNAME']
      default_password = ENV['XGRID_CONTROLLER_PASSWORD'].nil? ? "xgrid" : ENV['XGRID_CONTROLLER_PASSWORD'] 
      Trollop::Parser.new do
        banner banner_string
        opt :host, "Hostname or IP address of the xgrid controller", 
            :type=> String, 
            :default=> default_hostname
        opt :password, "Password to access the xgrid controller", 
            :type=> String, 
            :default=> default_password 
      end
    end

  end
end
