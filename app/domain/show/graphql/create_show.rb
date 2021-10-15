# frozen_string_literal: true

module Show
  module Graphql
    class CreateShow < ::Mutations::BaseMutation
      argument :catalog_movie_id, String, required: true
      argument :ticket_price, String, required: true
      argument :show_time, String, required: true

      field :show, Show::Graphql::ShowType, null: true

      def resolve(catalog_movie_id:, ticket_price:, show_time:)
        authorize! :show, to: :create?, with: Show::RepositoryPolicy, context: { user: context[:current_user] }
        show = Services::CreateShow.call catalog_movie_id, ticket_price, show_time

        { show: show }
      end
    end
  end
end
