# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'busser/beaker/version'

Gem::Specification.new do |spec|
  spec.name          = 'busser-beaker'
  spec.version       = Busser::Beaker::VERSION
  spec.authors       = ['Neill Turner']
  spec.email         = ['neillwturner@gmail.com']
  spec.description   = %q{A Busser runner plugin for Beaker}
  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/neillturner/busser-beaker'
  spec.license       = 'Apache 2.0'
  candidates = Dir.glob("{lib}/**/*") +  ['gemfile', 'busser-beaker.gemspec', 'LICENSE', 'Rakefile', 'README.md' ]
  spec.files = candidates.sort
  spec.executables   = []
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'busser'

  spec.add_development_dependency 'serverspec'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'aruba'

  spec.add_development_dependency 'cane'
  spec.add_development_dependency 'log_switch', '~> 0.3.0'
  spec.add_development_dependency 'tailor'
  spec.add_development_dependency 'countloc'

  spec.add_development_dependency 'coveralls'
end
