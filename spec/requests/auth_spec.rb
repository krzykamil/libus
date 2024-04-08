# frozen_string_literal: true

RSpec.describe "Basic Auth Spec", type: :request do
  context "when not authorized" do
    it "throws 401" do
      get "/"

      expect(last_response.status).to be(401)
    end
  end

  context "when authorized" do
    it "renders the home page" do
      login_as "A User"
      get "/"
      expect(last_response.status).to be(200)
    end
  end
end
