require 'spec_helper'

RSpec.describe 'Todo.txt gateway' do
  context 'without extra options' do
    let(:todos_path) { File.expand_path('./spec/fixtures/todo.txt') }
    let(:setup) do
      ROM.setup(todos: [:todotxt, todos_path])
    end

    describe 'specify relation' do
      it 'should not raise an error' do
        expect { setup.relation(:todos) }.not_to raise_error
      end
    end
  end
end
