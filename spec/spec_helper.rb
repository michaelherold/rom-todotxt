require 'bundler'
Bundler.require(:default, :test)

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'rom-todotxt'

ROM.use :auto_registration
