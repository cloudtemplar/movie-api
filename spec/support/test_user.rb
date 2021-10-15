# frozen_string_literal: true

class TestUser < Dry::Struct
  attribute :id, Structure::Types::UUID.default { SecureRandom.uuid }
  attribute :email, Structure::Types::String.default { Faker::Internet.email }
  attribute :password, Structure::Types::String.default { 'qwerty' }

  def self.cinema_owner(**attributes)
    CinemaOwner.new(**attributes).tap(&:setup)
  end

  def self.movie_goer(**attributes)
    MovieGoer.new(**attributes).tap(&:setup)
  end

  def setup
    Authentication::User.create!(
      id: id,
      email: email,
      password: password,
      password_confirmation: password,
      role: role
    )
  end

  def api_client
    api_token = Authentication::User.find(id).api_token
    ApiClient.new(headers: { 'Authorization' => "Bearer #{api_token}" })
  end

  class CinemaOwner < TestUser
    def role
      :cinema_owner
    end
  end

  class MovieGoer < TestUser
    def role
      :movie_goer
    end
  end
end
