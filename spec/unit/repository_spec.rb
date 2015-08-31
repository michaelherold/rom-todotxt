require 'spec_helper'

require 'rom/lint/spec'

RSpec.describe ROM::TodoTxt::Gateway do
  let(:gateway) { ROM::TodoTxt::Gateway }
  let(:uri) { File.expand_path('./spec/fixtures/todo.txt') }

  it_behaves_like 'a rom gateway' do
    let(:identifier) { :todotxt }
  end
end
