require 'rom/todotxt/parser/command'

module ROM
  module TodoTxt
    class Parser
      module Commands
        class ParseProjects < ROM::TodoTxt::Parser::Command
          REGEX = /(?:^|\s+)\+(?<projects>\w+)/.freeze

          def call
            {projects: @row.scan(REGEX).flatten}
          end
        end
      end
    end
  end
end
