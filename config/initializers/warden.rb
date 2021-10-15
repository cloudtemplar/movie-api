# frozen_string_literal: true

Rails.application.reloader.to_prepare do
  Warden::Strategies.add(:api_token, Authentication::Strategies::ApiTokenStrategy)
end
