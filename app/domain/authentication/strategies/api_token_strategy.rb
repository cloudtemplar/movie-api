# frozen_string_literal: true

module Authentication
  module Strategies
    class ApiTokenStrategy < Warden::Strategies::Base
      def valid?
        api_token.present?
      end

      def authenticate!
        user = ::Authentication::User.find_by(api_token: api_token)

        if user
          success!(user)
        else
          fail!
        end
      end

      private

      def api_token
        env['HTTP_AUTHORIZATION'].to_s.remove('Bearer ')
      end
    end
  end
end
