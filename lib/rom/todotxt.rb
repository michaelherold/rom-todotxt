require 'rom'
require 'rom/todotxt/gateway'
require 'rom/todotxt/relation'
require 'rom/todotxt/version'

ROM.register_adapter(:todotxt, ROM::TodoTxt)
