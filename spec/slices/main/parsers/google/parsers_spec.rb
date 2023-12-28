# frozen_string_literal: true


RSpec.describe Main::Parsers::Google::Isbn do
  before do
    # Do nothing
  end

  after do
    # Do nothing
  end

  context 'when condition' do
    it 'succeeds' do
      my_hash = {:hello => "goodbye"}
      described_class.parse(json: JSON.generate(my_hash))
    end
  end
end
