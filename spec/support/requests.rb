# frozen_string_literal: true

require "rack/test"

 RSpec.shared_context "Rack::Test" do
  # Define the app for Rack::Test requests
  # We need to boot it first to go through the warden start block
  let(:app) do
    Hanami.boot
    Hanami.app
  end
end

RSpec.configure do |config|
  config.include Rack::Test::Methods, type: :request
  config.include_context "Rack::Test", type: :request
  config.include Warden::Test::Helpers, type: :request
  config.after(:each, type: :request) { Warden.test_reset! }
end
