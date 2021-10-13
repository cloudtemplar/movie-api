# frozen_string_literal: true

module Catalog
  module Graphql
    class AddMovie < ::Types::BaseMutation
      argument :movies_api_id, String, required: true

      field :movie, Movies::Graphql::MovieType, null: true

      def resolve(movies_api_id:)
        movie = Services::AddMovie.call movies_api_id

        { movie: movie }
      end
    end
  end
end
