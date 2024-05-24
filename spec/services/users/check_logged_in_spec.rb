# frozen_string_literal: true

RSpec.describe Libus::Services::Users::CheckLoggedIn, :db, type: :service do
  subject(:result) { described_class.new(user: user, user_type: user_type).call }
  let(:admin_role) { factory[:role, name: "admin_user"] }
  let(:admin_user) { factory[:user, name: "Guy", email: "my@guy.com", role_id: admin_role.id] }
  let(:user_role) { factory[:role, name: "basic_user"] }
  let(:basic_user) { factory[:user, name: "Guy", email: "my21guy.com", role_id: user_role.id] }

  context "when user is logged in, he's admin and given type is admin" do
    let(:user) { admin_user }
    let(:user_type) { :admin }

    it { is_expected.to be_success }
    it "will return success message" do
      expect(result.success).to eq("Succesfully logged in")
    end
  end

  context "when user is logged in but he's basic_user and he wants to log in as admin" do
    let(:user) { basic_user }
    let(:user_type) { :admin }

    it { is_expected.to be_failure }
    it "will return error message" do
      expect(result.failure).to eq("User is not admin")
    end
  end

  context "when user is not logged" do
    let(:user) { nil }
    let(:user_type) { :basic_user }

    it { is_expected.to be_failure }
    it "will return error message" do
      expect(result.failure).to eq("User is not logged in")
    end
  end

  context "when user is logged in but there isnt any type given" do
    let(:user) { basic_user }
    let(:user_type) { nil }

    it { is_expected.to be_success }
    it "will return success message" do
      expect(result.success).to eq("Succesfully logged in")
    end
  end
end
