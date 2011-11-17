require 'rjobs/process'
require 'rjobs/job_handler'
require 'cucumber/rspec/doubles'
require 'aruba/api'
require 'aruba/hooks'
require 'aruba/reporting'

World(Aruba::Api)

Given /^the process was mocked$/ do  
  Rjobs::Process.stub!(:run).and_return("abc")
  Rjobs::JobHandler.stub!(:get_job_attributes).and_return("abc")
end


Then /^show me the output$/ do
  puts all_stdout
end

