# frozen_string_literal: true

module Rating
  module Services
    class RateMovie
      def self.call(catalog_id, rating, rater_id)
        Rating.rate_movie(catalog_id, rating, rater_id)
      end
    end
  end
end
