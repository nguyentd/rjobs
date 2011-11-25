require 'thor'
require 'rjobs/jobs_file'
require 'rjobs/job_input_file'
require 'rjobs/job_handler'
require 'rjobs/job'
require 'colorize'
require 'rjobs/cli_helper'

module Rjobs
  class RjStatusCli < Thor
    default_task :status
    include  CliHelper   

    desc "status jobs_file","list all jobs contained in the jobs_file"
    def status(jobs_file="")
      jobs = get_jobs_info(jobs_file)

      jobs.each do |job|        
        puts "#{job.name} - #{job.status_with_color}"
      end

    end

  end
end