# frozen_string_literal: true

RSpec.describe Main::Actions::IsbnSearch::Show, :db, type: :request do
  let(:params) { Hash[] }
  let(:basic_user) { factory[:user, name: "Guy", email: "my21guy.com"] }

  context "with good params"  do
    let(:params) { Hash[isbn: "978-0-306-40615-7"] }
    let(:env) { Rack::MockRequest.env_for("/", "warden" => double(user: basic_user), "router.params" => params) }

    let(:worker) { double(Main::Workers::IsbnSearch) }
    it "works" do
      Sidekiq::Testing.fake! do
        response = subject.call(env)
        allow(Main::Workers::IsbnSearch).to receive(:perform_async).with("978-0-306-40615-7").and_return(worker)
        expect(response.status).to eq 200
      end
    end

  end

  context "with bad params"  do
    let(:params) { Hash[] }

    it "fails" do
      response = subject.call(params)
      expect(JSON.parse(response.body[0])["errors"]).to eq({"isbn" => ["is missing"]})
      expect(response.status).to eq 422
    end
  end
end
