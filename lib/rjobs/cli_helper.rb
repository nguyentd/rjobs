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
  end
end
