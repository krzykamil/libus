# frozen_string_literal: true

require 'rspec'

RSpec.describe Main::Workers::IsbnSearch do
  context 'when condition' do
    it 'succeeds' do
      Main::Workers::IsbnSearch.perform_async("978-0-306-40615-7")
    end
  end
end
