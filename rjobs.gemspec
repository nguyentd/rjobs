# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rjobs/version"

Gem::Specification.new do |s|
  s.name        = "rjobs"
  s.version     = Rjobs::VERSION
  s.authors     = ["Nguyen Tran"]
  s.email       = ["merlinvn@gmail.com"]
  s.homepage    = "https://github.com/nguyentd/rjobs"
  s.summary     = %q{Gem to handle Jobs for XGrid}
  s.description = %q{Gem to handle Jobs for XGrid}

  s.rubyforge_project = "rjobs"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_development_dependency "cucumber"
  s.add_development_dependency "aruba"
  s.add_development_dependency "guard"
  s.add_development_dependency "growl_notify"
  s.add_development_dependency "guard-rspec"

  s.add_dependency "plist" 
  s.add_dependency "colorize" 
  s.add_dependency "trollop"
end
