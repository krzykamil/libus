# frozen_string_literal: true

require 'rspec'

RSpec.describe 'LoginSpec', :db, type: :request do
  before do
    # Do nothing
  end

  after do
    # Do nothing
  end

  context 'when condition' do
    it 'succeeds' do
      post "/users"
      expect(last_response).to be_successful
    end
  end
end
