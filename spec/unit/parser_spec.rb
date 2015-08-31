require 'spec_helper'

RSpec.describe ROM::TodoTxt::Parser do
  subject(:parser) { ROM::TodoTxt::Parser.new(todo) }
  let(:todo) { '(A) Thing I need to do +project +project2 @context @context2' }

  describe '#parse' do
    subject { parser.parse }

    it 'parses the priority' do
      expect(subject[:priority]).to eq('A')
    end

    it 'parses the projects' do
      expect(subject[:projects]).to eq(%w[project project2])
    end

    it 'parses the contexts' do
      expect(subject[:contexts]).to eq(%w[context context2])
    end

    it 'parses the task' do
      expect(subject[:task]).to eq('Thing I need to do')
    end
  end
end
