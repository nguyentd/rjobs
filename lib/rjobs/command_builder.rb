module Rjobs
  class CommandBuilder
    attr_accessor :command, :params    
    def initialize(command = "", params = "")
      @command = command
      @params = params
    end

    def build()
      cmd = []
      cmd <<  @command
      @params.each do |key, value|
        if value == ""
          cmd << "#{key}"
        else
          cmd << "-#{key}"
          cmd << value
        end        
      end
      cmd.join(" ")
    end
  end
end
