require 'rjobs/command_builder'
require 'rjobs/process'

module Rjobs
  class JobHandler
    
  
    def self.get_job_attributes(id)
      cm = CommandBuilder.build({:job => :attributes, :id => id})
      Process.run(cm) 
    end


  end
end
