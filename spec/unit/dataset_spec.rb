require 'spec_helper'

require 'rom/lint/spec'

RSpec.describe ROM::TodoTxt::Dataset do
  let(:data) do
    [
      {task: 'Thing I need to do', projects: %w[project project2], priority: 'A', contexts: %w[context context2]},
      {task: 'Priorityless thing I need to do', projects: %w[project], priority: nil, contexts: %w[context]},
      {task: 'Projectless thing I need to do', projects: [], priority: 'A', contexts: %w[context]},
      {task: 'Contextless thing I need to do', projects: %w[project], priority: 'A', contexts: []},
      {task: 'Bare thing I need to do', projects: [], priority: nil, contexts: []}
    ]
  end
  let(:dataset) { ROM::TodoTxt::Dataset.new(File.readlines(path).map(&:chomp)) }
  let(:path) { File.expand_path('./spec/fixtures/todo.txt') }

  it_behaves_like 'a rom enumerable dataset'
end
