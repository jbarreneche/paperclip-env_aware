# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "paperclip-env_aware/version"

Gem::Specification.new do |s|
  s.name        = "paperclip-env_aware"
  s.version     = Paperclip::Envaware::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Juan Manuel Barreneche"]
  s.email       = ["juanmanuel.barreneche@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Allow paperclip attachments to have a per environment config}
  s.description = %q{This gem allows, for example, to have different stores configurations per environment}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  # s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  # s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'activesupport', '>= 3.0'
  s.add_dependency 'paperclip'
end
