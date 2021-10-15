# frozen_string_literal: true

module Catalog
  module Graphql
    class Resolver < ::BaseResolver
      type [Movies::Graphql::MovieType], null: false

      argument :catalog_movie_id, String, required: false

      def resolve(**attributes)
        authorized_scope Catalog::Movies.catalog, context: { user: context[:current_user] }
      end
    end
  end
end
