# frozen_string_literal: true

module Catalog
  module Services
    class AddMovie
      def self.call(movies_api_id)
        movies_api_response = OmdbClient.movie(movies_api_id)
        Movies.add_movie(movies_api_response['Title'], movies_api_response['imdbID'])
      end
    end
  end
end
