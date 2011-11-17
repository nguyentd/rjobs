require 'plist'
module Rjobs
  class Job
    attr_accessor :id, :name, :status
    def initialize(id=0,xml="")
      @id = id
      parse(xml)
    end
    
    def xml=(xml)
      parse(xml)
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

