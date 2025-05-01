# frozen_string_literal: true

RSpec.describe Main::Actions::Sessions::Destroy do
  let(:params) { Hash[] }
  let(:user)    { "" }
  let(:env)     { instance_double('env') }

  let(:warden) do
    instance_double('warden', user: user).tap do |w|
      allow(w).to receive(:logout)
    end
  end

  before do
    allow_any_instance_of(Hanami::Action::Request).to receive(:env).and_return(env)
    allow(env).to receive(:[]).and_return(warden)
  end

  it "works" do
    response = subject.call(params)
    expect(response.status).to be(302)
  end
end
