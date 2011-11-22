require 'yaml'

module Rjobs
  class JobInputFile
    attr_accessor :jobName, :jobIdFrom, :jobIdTo, :command

    def initialize(fileName="")      
      parse(fileName)
    end

    def parse(fileName)
      config = YAML::load(File.open(fileName))
      @jobName = config['JobName']
      config['JobId'] =~ /(\d+)\-(\d+)/
      @jobIdFrom = $1      
      @jobIdTo = $2

      @command = config['Command']
    end

  end
end
