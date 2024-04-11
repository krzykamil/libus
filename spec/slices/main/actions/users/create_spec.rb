# frozen_string_literal: true

RSpec.describe Main::Actions::Users::Create, :db do
  it "works with the right params" do
    params = {
      email: "some@email.com",
      name: "John Doe",
      password: "password",
      password_confirmation: "password"
    }

    response = subject.call(params)
    expect(response).to be_successful
  end

  context "with bad params" do
    let(:params) { Hash[] }
    it "fails with missing params" do
      response = subject.call({})
      expect(response).not_to be_successful
    end
  end

  context "with password missmatch" do
    let(:params) {
      { email: "good@email.com", name: "John Doe", password: "somepassword", password_confirmation: "differentthing" }
    }

    it "fails with password missmatch" do
      response = subject.call(params)
      expect(response).not_to be_successful
    end
  end

  context "with email already taken" do
    let!(:user) { factory[:user, name: "Guy", email: "my@guy.com"] }
    let(:params) { { email: "my@guy.com", name: "John Doe", password: "password", password_confirmation: "password" } }

    it "fails with" do
      response = subject.call(params)
      expect(response).not_to be_successful
    end
  end
end
