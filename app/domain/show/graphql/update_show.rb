# frozen_string_literal: true

module Show
  module Graphql
    class UpdateShow < ::Mutations::BaseMutation
      argument :show_id, String, required: true
      argument :ticket_price, String, required: false
      argument :show_time, String, required: false

      field :show, Show::Graphql::ShowType, null: true

      def resolve(**attributes)
        authorize! :show, to: :update?, with: Show::RepositoryPolicy, context: { user: context[:current_user] }
        show = Services::UpdateShow.call attributes

        { show: show }
      end
    end
  end
end
