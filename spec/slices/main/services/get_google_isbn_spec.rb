# frozen_string_literal: true

RSpec.describe Main::Services::GetGoogleIsbn do
  subject(:service) { described_class.new.(isbn:) }

  let(:isbn) { "1841499897" }

  context 'when correct api call and response' do
    it 'succeeds' do
      expect(service).to be_a(String)
    end

    it 'is a valid JSON' do
      expect { JSON.parse(service) }.not_to raise_error
    end
  end

  context 'when incorrect api call' do
    let(:isbn) { "nie" }

    it 'is empty' do
      expect(JSON.parse(service)).to match(hash_including("totalItems" => 0))
    end
  end
end
