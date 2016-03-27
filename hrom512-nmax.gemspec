# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hrom512/nmax/version'

Gem::Specification.new do |spec|
  spec.name          = 'hrom512-nmax'
  spec.version       = Hrom512::Nmax::VERSION
  spec.authors       = ['Khrebtov Roman']
  spec.email         = ['roman@alltmb.ru']

  spec.summary       = 'Search N maximum elements in the input stream.'
  spec.homepage      = 'https://github.com/hrom512/nmax'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = ['nmax']
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
end
