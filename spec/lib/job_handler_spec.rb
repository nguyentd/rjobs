require 'rjobs/job_handler'
require 'rjobs/job'
require 'data_helper'

describe Rjobs::JobHandler do

  before(:each) do
    @jobAttributes = DataHelper.jobAttributes
  end

  it "should have get attributes command" do
    #process = mock(Rjobs::Process)
    Rjobs::Process.stub!(:run).and_return(@jobAttributes)
    Rjobs::JobHandler.get_job_attributes(1).should match /MyFirstJob/
    
  end

  it "should have a job submit function" do
    job = Rjobs::Job.new()    
    job.command = "test"
    job.params = {:a => "a", :b => "b" , "this is test" => ""}
        
    Rjobs::Process.stub!(:run).and_return(DataHelper.jobSubmit)
    Rjobs::JobHandler.submit_job(job)
    job.id.should == 11
  end

end

