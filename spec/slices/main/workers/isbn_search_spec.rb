# frozen_string_literal: true

require 'rspec'

RSpec.describe Main::Workers::IsbnSearch do
  context 'when called' do
    let(:google_isbn_service) { double(Main::Services::GetGoogleIsbn) }
    let(:parser) { double(Main::Services::GetGoogleIsbn) }

    it 'processes the job' do
      # TODO: once I add persistence layer/memory holding I will want to check if during this process the progress of the search is updated
      expect(Main::Services::GetGoogleIsbn).to receive(:new).and_return(google_isbn_service)
      expect(Main::Parsers::Google::Isbn).to receive(:new).and_return(parser)
      expect(google_isbn_service).to receive(:call).with(isbn: "1841499897").and_return({ body: "some body" })
      expect(parser).to receive(:parse).with(json: { body: "some body" })
      Main::Workers::IsbnSearch.perform_async("1841499897")
    end
  end
end
