# frozen_string_literal: true

require 'rspec'

RSpec.describe 'AuthenticationSpec', :db, type: :request do
  context 'when action inherits from authenticated action' do
    context "when user is logged in" do
      let!(:user) { factory[:user, name: "Guy", email: "my@guy.com"] }

      before do
        allow(Main::Workers::IsbnSearch).to receive(:perform_async).with("978-0-306-40615-7").and_return(double(Main::Workers::IsbnSearch))
      end

      it 'succeeds' do
        login_as user
        get "/search/isbn", { isbn: "978-0-306-40615-7" }
        expect(last_response.status).to be(200)
      end
    end

    context "when there is no user" do
      it "rejects the request, redirects" do
        get "/search/isbn", { isbn: "123123" }
        expect(last_response.status).to be(302)
      end
    end
  end
end
