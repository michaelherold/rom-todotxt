require 'rom/support/inflector'
require 'rom/todotxt/parser/commands'

module ROM
  module TodoTxt
    class Parser
      # Ensure Commands module is initialized
      module Commands; end

      def initialize(row)
        @row = row.dup
      end

      def method_missing(method_name, *args, &block)
        command_name = command_name_for_method(method_name)

        if Commands.const_defined?(command_name)
          command_class = Commands.const_get(command_name)
          command_class.new(@row, *args, &block).call
        else
          super
        end
      end

      def parse
        %w[parse_contexts parse_priority parse_projects parse_task]
          .map { |method| __send__(method) }
          .reduce(:merge)
      end

      private

      def command_name_for_method(method_name)
        method_name.to_s.gsub(/(?:^|_)([a-z])/) { Regexp.last_match[1].upcase }
      end

      def construct_attr(name, data)
        data = Array(data)

        if data.size > 1
          {ROM::Inflector.pluralize(name).to_sym => data}
        else
          {name => data.first}
        end
      end

      def parsers
        @parsers ||= {
          context: /(?:^|\s+)@(?<context>\w+)/.freeze,
          priority: /(?:^|\s+)\((?<priority>[A-Za-z])\)\s+/.freeze,
          project: /(?:^|\s+)\+(?<projects>\w+)/.freeze
        }.freeze
      end

      def parse_task
        construct_attr(:task, parsers.each_with_object(@row.dup) do |(_, parser), row|
          row.gsub!(parser, '')
        end)
      end
    end
  end
end
