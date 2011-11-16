# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dm-tags/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors     = [ 'Bobby Calderwood' ]
  gem.email       = [ 'bobby_calderwood [a] me [d] com' ]
  gem.summary     = "This package brings tagging to DataMapper.  It is inspired by Acts As Taggable On by Michael Bleigh, github's mbleigh.  Props to him for the contextual tagging based on Acts As Taggable on Steroids."
  gem.description = gem.summary
  gem.homepage    = "http://datamapper.org"

  gem.files            = `git ls-files`.split("\n")
  gem.test_files       = `git ls-files -- {spec}/*`.split("\n")
  gem.extra_rdoc_files = %w[LICENSE README.rdoc]

  gem.name          = 'dm-tags'
  gem.require_paths = [ "lib" ]
  gem.version       = DataMapper::Tags::VERSION

  gem.add_runtime_dependency('dm-core', '~> 1.3.0.beta')

  gem.add_development_dependency('rake',    '~> 0.9.2')
  gem.add_development_dependency('rspec',   '~> 1.3.2')
end
