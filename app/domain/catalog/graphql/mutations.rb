# frozen_string_literal: true

module Catalog
  module Graphql
    module Mutations
      def self.included(base_class)
        base_class.instance_eval do
          field(:catalog_add_movie, mutation: Catalog.graphql.add_movie)
        end
      end
    end
  end
end
