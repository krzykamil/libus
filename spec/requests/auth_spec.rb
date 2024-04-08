# frozen_string_literal: true

RSpec.describe "Basic Auth Spec", :db, type: :request do
  context "when not authorized" do
    it "throws 401" do
      get "/"

      expect(last_response.status).to be(401)
    end
  end

  context "when authorized" do
    let!(:user) { factory[:user, name: "Guy", email: "my@guy.com"] }
    it "renders the home page" do
      login_as user
      get "/"
      expect(last_response.status).to be(200)
    end
  end
end
