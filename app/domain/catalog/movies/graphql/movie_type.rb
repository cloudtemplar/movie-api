# frozen_string_literal: true

module Catalog
  module Movies
    module Graphql
      class MovieType < ::Types::BaseObject
        field :title, String, null: false
        field :imdb_id, String, null: false
        field :year, String, null: true
        field :rated, String, null: true
        field :released, String, null: true
        field :runtime, String, null: true
        field :genre, String, null: true
        field :director, String, null: true
        field :writer, String, null: true
        field :actors, String, null: true
        field :plot, String, null: true
        field :language, String, null: true
        field :country, String, null: true
        field :awards, String, null: true
        field :poster, String, null: true
        field :metascore, String, null: true
        field :imdb_rating, String, null: true
        field :imdb_votes, String, null: true
        field :dvd, String, null: true
        field :box_office, String, null: true
        field :production, String, null: true
        field :website, String, null: true
        field :ratings, [RatingsType], null: true
        field :user_rating, Rating.graphql.user_rating_type, null: true

        def user_rating
          Rating.user_rating(context[:current_user], object.id)
        end
      end
    end
  end
end
