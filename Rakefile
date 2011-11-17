require "bundler/gem_tasks"


desc 'List all defined steps'
task :steps do
  require 'hirb'
  extend Hirb::Console
  puts "CUCUMBER steps:"
  puts ""
  #step_definition_dir = "features/step_definitions"
  step_definition_dir = "."
  #step_definition_dir = "/Users/merlin/.rvm/gems/ruby-1.9.2-p290/gems/aruba-0.4.7/lib/aruba/"

  Dir.glob(File.join(step_definition_dir,'**/*.rb')).each do |step_file|

    puts "File: #{step_file}"
    puts ""
    results = []
    File.new(step_file).read.each_line.each_with_index do |line, number|

      next unless line =~ /^\s*(?:Given|When|Then)\s+|\//
        res = /(?:Given|When|Then)[\s\(]*\/(.*)\/([imxo]*)[\s\)]*do\s*(?:$|\|(.*)\|)/.match(line)
      next unless res
      matches = res.captures
      results << OpenStruct.new(
        :steps => matches[0],
        :modifier => matches[1],
        :args => matches[2]
      )
        end
      table results, :resize => false, :fields=>[:steps, :modifier, :args]
      puts ""
  end
end
