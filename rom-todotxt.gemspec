# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rom/todotxt/version'

Gem::Specification.new do |spec|
  spec.name         = 'rom-todotxt'
  spec.version      = ROM::TodoTxt::VERSION.dup
  spec.authors      = ['Michael Herold']
  spec.email        = ['michael.j.herold@gmail.com']
  spec.summary      = 'Todo.txt support for ROM'
  spec.description  = spec.summary
  spec.homepage     = 'https://github.com/michaelherold/rom-todotxt'
  spec.license      = 'MIT'

  spec.files = %w[LICENSE.md README.md Rakefile rom-todotxt.gemspec]
  spec.files += Dir['lib/**/*.rb']
  spec.require_paths = ['lib']

  spec.add_dependency 'rom', '~> 0.9', '>= 0.9.0'

  spec.add_development_dependency 'bundler'
end
