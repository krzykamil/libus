# frozen_string_literal: true


RSpec.describe Main::Repositories::Books, :db do
  let!(:dune) { factory[:book, title: "Dune", isbn_13: "9780441172719"] }

  context '#listing' do
    it 'returns all books' do
      expect(described_class.new.listing).to eq([dune])
    end
  end

  context '#by_isbn' do
    it 'succeeds' do
      expect(described_class.new.by_isbn(type: 13, identifier: "9780441172719").title).to eq "Dune"
    end
  end
end
