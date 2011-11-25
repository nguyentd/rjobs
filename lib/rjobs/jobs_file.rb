
module Rjobs
  class JobsFile
    def initialize(jobs_file="")
      @job_ids = []
      @job_names = []

      unless jobs_file.empty?
        File.open(jobs_file, "r") do |infile|
          while (line = infile.gets)
            unless line.empty? 
              line =~ /(\w+)[\t\s](\d+)(\n)*/          
              @job_names << $1.to_s.strip
              @job_ids << $2.to_s.strip
            end         
          end
        end
      end
    end

    def ids
      @job_ids
    end
    
    def job_names
      @job_names
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
