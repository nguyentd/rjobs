require 'aruba'
require 'cucumber/rspec/doubles'

ENV["RAILS_ENV"] ||= "cucumber"
ENV['PATH'] = "#{File.expand_path(File.dirname(__FILE__) + '/../../bin')}#{File::PATH_SEPARATOR}#{ENV['PATH']}"
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib') unless $LOAD_PATH.include?(File.dirname(__FILE__) + '/../../lib')