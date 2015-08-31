module ROM
  module TodoTxt
    class Parser
      class Command
        attr_reader :parser

        def initialize(row)
          @row = row
        end

        def call
          fail NotImplementedError.new('Method #call should be overridden in child classes')
        end
      end
    end
  end
end
