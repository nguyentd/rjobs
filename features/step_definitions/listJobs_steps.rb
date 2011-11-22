require 'rjobs/process'
require 'rjobs/job_handler'
require 'cucumber/rspec/doubles'
require 'aruba/api'
require 'aruba/hooks'
require 'aruba/reporting'

World(Aruba::Api)

Then /^show me the output$/ do
  puts all_stdout
end

