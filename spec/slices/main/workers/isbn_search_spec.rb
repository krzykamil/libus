# frozen_string_literal: true

RSpec.describe Main::Workers::IsbnSearch, :db do
  let(:google_isbn_service) { double(Main::Services::GetGoogleIsbn) }
  let(:parser) { double(Main::Services::GetGoogleIsbn) }

  context 'when called' do
    let(:parse_output) {
      { title: "Dune",
        description: "A nice SF book",
        published_date: "1965",
        category: "SF",
        language: "en",
        authors: ["Frank Herbert"],
        isbn_numbers: [
          { type: 10, identifier: "0441172717" },
          { type: 13, identifier: "9780441172719" }
        ]
      }

    }

    it 'processes the job' do
      expect(Main::Services::GetGoogleIsbn).to receive(:new).and_return(google_isbn_service)
      expect(Main::Parsers::Google::Isbn).to receive(:new).and_return(parser)
      expect(google_isbn_service).to receive(:call).with(isbn: "9780441172719").and_return({ body: "some body" })
      expect(parser).to receive(:parse).with(json: { body: "some body" }).and_return(parse_output)

      expect{Main::Workers::IsbnSearch.perform_async("9780441172719")}.to change{db[:books].count}.by(1)

      expect(Hanami.app["redis"].hget("isbn_search", "9780441172719")).to eq("3")
    end
  end

  context "when bad isbn" do
    let(:parse_output) { {} }

    it 'cuts the job short' do
      expect(Main::Services::GetGoogleIsbn).to receive(:new).and_return(google_isbn_service)
      expect(Main::Parsers::Google::Isbn).to receive(:new).and_return(parser)
      expect(google_isbn_service).to receive(:call).with(isbn: "123123123").and_return({ body: "some body" })
      expect(parser).to receive(:parse).with(json: { body: "some body" }).and_return(parse_output)

      expect{Main::Workers::IsbnSearch.perform_async("123123123")}.not_to change{db[:books].count}

      expect(Hanami.app["redis"].hget("isbn_search", "123123123")).to eq("0")
    end
  end
end
