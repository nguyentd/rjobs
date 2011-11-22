require 'rjobs/command_builder'
require 'rjobs/job'
describe Rjobs::CommandBuilder do
  it "should have a class name CommandBuilder" do
    cb = Rjobs::CommandBuilder.new
    cb.should_not == nil
  end 

  it "should build get job attributes command" do
    cb = Rjobs::CommandBuilder.new("xgrid", {
      :h => "127.0.0.1",
      :p => "xgrid",
      :f => "xml",
      :job => :attributes,
      :id => 1
    })      

    cb.build.should == "xgrid -h 127.0.0.1 -p xgrid -f xml -job attributes -id 1"
  end

  

end

