# -*- encoding: utf-8 -*-
require File.expand_path('../lib/mars_rover/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dalibor Nasevic"]
  gem.email         = ["dalibor.nasevic@gmail.com"]
  gem.description   = %q{Tool for deploying and controlling a squad of robotic rovers on a plateau on Mars}
  gem.summary       = %q{Tool for controlling robotic rovers on Mars}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "mars_rover"
  gem.require_paths = ["lib"]
  gem.version       = MarsRover::VERSION

  gem.add_development_dependency "rspec"
end
