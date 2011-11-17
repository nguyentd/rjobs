
module Rjobs
  class Process
    attr_accessor :stdout, :stderr
    def initialize()
    end  
    

    def self.run(cmd)
      IO.popen(cmd){ |stdout|
        stdout.readlines.join
      }
    end
  end
end
