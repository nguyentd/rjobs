
module Rjobs
  class JobsFile
    def initialize(jobs_file="")
      @job_ids = []

      unless jobs_file.empty?
        File.open(jobs_file, "r") do |infile|
          while (line = infile.gets)
            @job_ids << line.sub(/\n/,"")
          end
        end
      end
    end

    def ids
      @job_ids
    end
    
    
    def list_all
      puts @job_ids.join("\n")
    end

    def write(file_name, jobs)

      File.open(file_name, 'w') { |f| 
        jobs.each do |job|
          f << job.name << "\t" << job.id << "\n"
        end
      }

    end

  end
end
