require 'rom/memory/dataset'
require 'rom/todotxt/parser'

module ROM
  module TodoTxt
    # Todo.txt in-memory dataset used by Todo.txt gateways
    #
    # @api public
    class Dataset < ROM::Memory::Dataset
      option :path, reader: true

      def self.row_proc
        ->(row) { Parser.new(row).parse }
      end
    end
  end
end
