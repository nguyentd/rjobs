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

Then /^each line of the output should match \/([^\/]*)\/$/ do |expected|
    all_stdout.split("\n").each do |line|
      # puts line
      line.should match expected
    end
end