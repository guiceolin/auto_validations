# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "auto_validations/version"

Gem::Specification.new do |s|
  s.name        = "auto_validations"
  s.version     = AutoValidations::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Rodrigo Navarro', 'Guilherme Ceolin']
  s.email       = ['rnavarro1@gmail.com', 'guiceolin@gmail.com']
  s.homepage    = ""
  s.summary     = %q{Auto generate validations for your models}
  s.description = %q{Extract validations from your database information}

  s.rubyforge_project = "auto_validations"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'activerecord', '~> 3'

  s.add_development_dependency 'sqlite3-ruby', '~> 1.3'
end
