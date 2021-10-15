# frozen_string_literal: true

class ApiClient
  def initialize(headers: {})
    @client = Faraday.new do |builder|
      builder.request :json
      builder.response :json, content_type: 'application/json'
      builder.adapter :rack, Rails.application
    end
    @headers = headers
  end

  def post(url, data = {}, headers = {})
    @client.post(url, data.to_json, @headers.merge(headers))
  end
end
