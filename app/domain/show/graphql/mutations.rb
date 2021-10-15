# frozen_string_literal: true

module Show
  module Graphql
    module Mutations
      def self.included(base_class)
        base_class.instance_eval do
          field(:show_create_show, mutation: Show.graphql.create_show)
          field(:show_update_show, mutation: Show.graphql.update_show)
        end
      end
    end
  end
end
