# frozen_string_literal: true

RSpec.describe Main::Actions::IsbnSearch::Show do
  let(:params) { Hash[] }

  context "with good params"  do
    let(:params) { Hash[isbn: "978-0-306-40615-7"] }
    it "works" do
      response = subject.call(params)
      expect(response.status).to eq 200
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
