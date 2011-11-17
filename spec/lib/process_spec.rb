require 'rjobs/process'
describe Rjobs::Process do
  it "can execute a simple command" do
    cmd = "echo Hello World!"
    #cmd = "ls"
    Rjobs::Process.run(cmd).should == "Hello World!\n"
  end

  it "should have stdout attribute" do
    cmd = "echo Hello World!"
    #cmd = "ls"
    output = Rjobs::Process.run(cmd)
    
    output.should == "Hello World!\n"
  end


end
