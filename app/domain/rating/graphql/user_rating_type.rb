# frozen_string_literal: true

module Rating
  module Graphql
    class UserRatingType < ::Types::BaseObject
      field :catalog_movie_id, String, null: false
      field :rating, String, null: false
      field :rater_id, String, null: false
    end
  end
end
