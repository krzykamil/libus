# frozen_string_literal: true

require 'rspec'
require 'bcrypt'
RSpec.describe 'LoginSpec', :db, type: :request do
  let(:params) { { email: "my@guy.com", password: 'greatpassword' } }
  let!(:user) do
    password_salt = BCrypt::Engine.generate_salt
    password_hash = BCrypt::Engine.hash_secret("greatpassword", password_salt)
    factory[:user, name: "Guy", email: "my@guy.com", password_hash: password_hash, password_salt: password_salt]
  end

  context 'when logging in with good credentials' do
    it 'succeeds' do
      post "/sessions", params
      expect(last_response).to be_redirect
    end
  end

  context "when logging in with bad credentials" do
    let(:params) { { email: "my@guy.com", password: 'noneonon' } }
    it "does not continue" do
      post "/sessions", params
      expect(last_response).not_to be_successful
    end
  end
end
