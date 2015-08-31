require 'rom/support/inflector'

module ROM
  module TodoTxt
    class Parser
      def initialize(row)
        @row = row.dup
      end

      def parse
        private_methods
          .select { |method_name| method_name.to_s.start_with?('parse_') }
          .map { |method| __send__(method) }
          .reduce(:merge)
      end

      private

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

      def parse_context
        construct_attr(:context, @row.scan(parsers[:context]).flatten)
      end

      def parse_priority
        construct_attr(:priority, @row.scan(parsers[:priority]).flatten)
      end

      def parse_project
        construct_attr(:project, @row.scan(parsers[:project]).flatten)
      end

      def parse_task
        construct_attr(:task, parsers.each_with_object(@row.dup) do |(_, parser), row|
          row.gsub!(parser, '')
        end)
      end
    end
  end
end
