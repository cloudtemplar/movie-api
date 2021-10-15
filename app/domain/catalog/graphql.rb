# frozen_string_literal: true

module Catalog
  module Graphql
    def self.resolver
      Resolver
    end

    def self.mutations
      Catalog::Graphql::Mutations
    end

    def self.add_movie
      Graphql::AddMovie
    end

    def self.movie_type
      Movies::Graphql::MovieType
    end
  end
end
