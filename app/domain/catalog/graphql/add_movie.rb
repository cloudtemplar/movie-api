# frozen_string_literal: true

module Catalog
  module Graphql
    class AddMovie < ::Mutations::BaseMutation
      argument :movies_api_id, String, required: true

      field :movie, Movies::Graphql::MovieType, null: true

      def resolve(movies_api_id:)
        authorize! :movie, to: :add?, with: Catalog::Movies::RepositoryPolicy, context: { user: context[:current_user] }
        movie = Services::AddMovie.call movies_api_id

        { movie: movie }
      end
    end
  end
end
