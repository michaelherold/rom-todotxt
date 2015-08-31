require 'spec_helper'

require 'rom/lint/spec'

RSpec.describe ROM::TodoTxt::Dataset do
  let(:data) do
    [
      {task: 'Thing I need to do', projects: %w[project project2], priority: 'A', contexts: %w[context context2]},
      {task: 'Priorityless thing I need to do', project: 'project', priority: nil, context: 'context'},
      {task: 'Projectless thing I need to do', project: nil, priority: 'A', context: 'context'},
      {task: 'Contextless thing I need to do', project: 'project', priority: 'A', context: nil},
      {task: 'Bare thing I need to do', project: nil, priority: nil, context: nil}
    ]
  end
  let(:dataset) { ROM::TodoTxt::Dataset.new(File.readlines(path).map(&:chomp)) }
  # let(:dataset) { ROM::TodoTxt::Dataset.new(['(A) Thing I need to do +project +project2 @context']) }
  let(:path) { File.expand_path('./spec/fixtures/todo.txt') }

  it_behaves_like 'a rom enumerable dataset'
end
