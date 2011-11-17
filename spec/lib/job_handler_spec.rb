require 'rjobs/job_handler'
require 'data_helper'

describe Rjobs::JobHandler do

  before(:each) do
    @jobAttributes = DataHelper.jobAttributes
  end


  it "should get the attributes of a specific job" do
    #process = mock(Rjobs::Process)
    Rjobs::Process.stub!(:run).and_return(@jobAttributes)
    Rjobs::JobHandler.get_job_attributes(1).should match /MyFirstJob/
  end

end

