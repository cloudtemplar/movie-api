# frozen_string_literal: true

module Rating
  module Graphql
    class RateMovie < ::Mutations::BaseMutation
      argument :catalog_movie_id, String, required: true
      argument :rating, Integer, required: true

      field :catalog_movie_id, String, null: false
      field :rating, Integer, null: false
      field :rater_id, String, null: false

      def resolve(catalog_movie_id:, rating:)
        current_user = context[:current_user]
        authorize! :rating, to: :rate?, with: Rating::RepositoryPolicy, context: { user: current_user }
        rating = Services::RateMovie.call catalog_movie_id, rating, current_user.id

        { 
          catalog_movie_id: rating.catalog_movie_id,
          rating: rating.rating,
          rater_id: rating.rater_id
        }
      end
    end
  end
end
