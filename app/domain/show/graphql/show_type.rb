# frozen_string_literal: true

module Show
  module Graphql
    class ShowType < ::Types::BaseObject
      field :id, String, null: false
      field :catalog_movie_id, String, null: false
      field :show_time, String, null: false
      field :ticket_price, String, null: false
      field :movie, Catalog.graphql.movie_type, null: false
    end
  end
end
