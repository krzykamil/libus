# frozen_string_literal: true

RSpec.describe Main::Actions::Users::Create, :db do
  let!(:role) { factory[:role, name: "basic_user"] }

  params = {
    email: "some@email.com",
    name: "John Doe",
    password: "password",
    password_confirmation: "password"
  }
  let(:user)    { factory[:user] }
  let(:env)     { instance_double('env') }

  let(:warden) do
    instance_double('warden', user: user).tap do |w|
      allow(w).to receive(:set_user)
    end
  end

  before do
    allow_any_instance_of(Hanami::Action::Request).to receive(:env).and_return(env)
    allow(env).to receive(:[]).and_return(warden)
  end

  context "with right params" do
    it "redirects to the home page" do
      response = subject.call(params)
      expect(response.status).to eq(302)
    end

    it "returns flash notice" do
      response = subject.call(params)
      expect(response.flash.next[:notice]).to eq("Welcome to Libus John Doe!")
    end
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
