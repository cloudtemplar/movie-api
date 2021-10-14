# frozen_string_literal: true

module Catalog
  module Graphql
    class CatalogType < ::Types::BaseObject
      field :movies, [Movies::Graphql::MovieType], null: false

      def movies
        authorized_scope Movies.catalog, context: { user: context[:current_user] }
      end
    end
  end
end
