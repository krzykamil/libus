# frozen_string_literal: true
require 'bcrypt'
RSpec.describe Main::Actions::Sessions::Create, :db, type: :request do
  context "with correct credentials" do
    let(:params) { { email: "my@guy.com", password: 'greatpassword' } }
    let!(:user) do
      password_salt = BCrypt::Engine.generate_salt
      password_hash = BCrypt::Engine.hash_secret("greatpassword", password_salt)
      factory[:user, name: "Guy", email: "my@guy.com", password_hash: password_hash, password_salt: password_salt]
    end

    it "logs the user in, redirects" do
      post "/sessions", params
      expect(last_response).to be_redirect
    end
  end

  context "with invalid data" do
    let(:params) { { email: "my@guy.com", password: 'noneonon' } }
    it "throws an error" do
      post "/sessions", params
      expect(last_response).not_to be_successful
    end
  end
end
