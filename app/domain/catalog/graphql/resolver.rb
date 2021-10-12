# frozen_string_literal: true

module Catalog
  module Graphql
    class Resolver < ::BaseResolver
      type ::Catalog::Graphql::CatalogType, null: false

      def resolve
        true
      end
    end
  end
end
