module Rjobs
  class CommandBuilder
    @@host = "127.0.0.1"
    @@password = "xgrid"


    def initialize()
     
    end

    def self.build(params)
      cmd = []
      cmd <<  "xgrid"
      cmd << "-h #{@@host}"
      cmd << "-p #{@@password}"
      cmd << "-f xml"
      params.each do |key, value|
        cmd << "-#{key}"
        cmd << value
      end
      cmd.join(" ")
    end

  end
end
