# frozen_string_literal: true

RSpec.describe 'ImageUploadSpec', :db, type: :request do
  context 'when photo is uploaded' do
    context "when user is logged in" do
      let!(:user) { factory[:user, name: "Guy", email: "my@guy.com"] }
      let!(:book) { factory[:book] }

      it 'changes the photo' do
        login_as user

        patch "/books/#{book.id}", { id: book.id, book: { image: Rack::Test::UploadedFile.new("spec/fixtures/image.png") } }

        expect(JSON.parse(rom.relations[:books].first.image_data)["id"]).to be_a(String)
        expect(last_response.status).to be(302)
      end
    end
  end
end
