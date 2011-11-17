require 'rjobs/job'
require 'data_helper'
describe "Job Spec" do
  before(:each) do

    @jobAttributes = DataHelper.jobAttributes
    @job = Rjobs::Job.new(0,@jobAttributes)

  end
  it "should exist a class name Job" do    
    @job.should_not == nil
  end

  it "should have an id attribute" do
    @job.id = 123
    @job.id.should == 123
  end 

  it "should have a name attribute" do
    @job.name = "TestJob"
    @job.name.should == "TestJob"
  end

  it "can get attribute name from xml attribute" do
    @job.name.should == 'MyFirstJob'
  end

  it "should have a status attribute" do
    @job.status = "Pending"
    @job.status.should == "Pending"
  end

  it "should get status from xml attribute" do
    @job.status.should == "Finished"
  end

  it "should parse xml when assign to xml attribute reader" do
    @job.xml = @jobAttributes
    @job.status.should == "Finished"    
  end

end
