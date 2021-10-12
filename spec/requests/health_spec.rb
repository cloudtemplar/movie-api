# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /health', type: :request do
  it 'succeeds' do
    get '/health'

    expect(response).to be_successful
  end
end
