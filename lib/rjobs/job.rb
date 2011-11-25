require 'plist'
require 'rjobs/command_builder'
require 'colorize'

module Rjobs
  class Job
    attr_accessor :id, :name, :status
    attr_writer :params, :command

    def initialize(id=0,xml="")
      @id = id
      parse(xml)
      @params= {}
      @command = ""
    end
    
    def xml=(xml)
      parse(xml)
    end

    def command
      cb = Rjobs::CommandBuilder.new(@command,@params)
      cb.build
    end
    
    def status_with_color
      case @status
      when /Finished/
        @status.green
      when /Failed/
        @status.light_red
      when /Not Exist/
        @status.red
      else
        @status
      end
    end


    private
    def parse(xml)
      return if xml.empty?
      result = Plist::parse_xml(xml)
      @name = result['jobAttributes'].nil? ? "" : result['jobAttributes']['name']      
      @status = result['jobAttributes'].nil? ? "Not Exist" : result['jobAttributes']['jobStatus']      
      
    end



  end
end

