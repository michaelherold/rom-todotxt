require 'rom/todotxt/parser/command'

module ROM
  module TodoTxt
    class Parser
      module Commands
        class ParsePriority < ROM::TodoTxt::Parser::Command
          REGEX = /(?:^|\s+)\((?<priority>[A-Za-z])\)\s+/.freeze

          def call
            {priority: @row.scan(REGEX).flatten.first}
          end
        end
      end
    end
  end
end
