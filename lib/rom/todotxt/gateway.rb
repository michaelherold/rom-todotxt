require 'rom/gateway'
require 'rom/todotxt/dataset'

module ROM
  module TodoTxt
    # Todo.txt gateway interface
    #
    # @api public
    class Gateway < ROM::Gateway
      def initialize(path)
        @datasets = {}
        @path = path
        @connection = ::File.readlines(path).map(&:chomp)
      end

      def [](name)
        datasets[name]
      end

      def dataset(name)
        datasets[name] = Dataset.new(connection, dataset_options)
      end

      def dataset?(name)
        datasets.key?(name)
      end

      private

      # @attr_reader [Hash] datasets Todo.txt datasets from sources
      #
      # @api private
      attr_reader :datasets

      # @attr_reader [String] path Path to todo.txt
      #
      # @api private
      attr_reader :path

      def dataset_options
        {path: path}
      end
    end
  end
end
