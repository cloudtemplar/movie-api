# frozen_string_literal: true

module Rating
  module Graphql
    def self.mutations
      Rating::Graphql::Mutations
    end

    def self.user_rating_type
      Graphql::UserRatingType
    end

    def self.rate_movie
      Graphql::RateMovie
    end
  end
end
