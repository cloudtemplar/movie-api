# frozen_string_literal: true

module Catalog
  module Graphql
    class CatalogType < ::Types::BaseObject
      field :movies, [Movies::Graphql::MovieType], null: false

      def movies
        Movies.catalog
      end
    end
  end
end
