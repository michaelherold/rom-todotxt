require 'rom/todotxt/parser/command'

module ROM
  module TodoTxt
    class Parser
      module Commands
        class ParseContexts < ROM::TodoTxt::Parser::Command
          REGEX = /(?:^|\s+)@(?<contexts>\w+)/.freeze

          def call
            {contexts: @row.scan(REGEX).flatten}
          end
        end
      end
    end
  end
end
