module Rjobs
  class JobsFile
    def initialize(jobs_file)
      @jobIds = []
      File.open(jobs_file, "r") do |infile|
        while (line = infile.gets)
          @jobIds << line.sub(/\n/,"")          
        end
      end
    end

    def ids
      @jobIds
    end
    
    
    def list_all
      puts @jobIds.join("\n")
    end
  end
end
