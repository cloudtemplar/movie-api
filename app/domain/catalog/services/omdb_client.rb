# frozen_string_literal: true

module Catalog
  module Services
    class OmdbClient
      class << self
        def movie(omdb_id)
          response = Faraday.get url omdb_id
          JSON.parse response.body
        end

        private

        def url(omdb_id)
          access_key = Rails.application.credentials.omdb.fetch :access_key
          "http://www.omdbapi.com/?apikey=#{access_key}&i=#{omdb_id}"
        end
      end
    end
  end
end
