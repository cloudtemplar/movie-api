# frozen_string_literal: true

module Show
  module Graphql
    class Resolver < ::BaseResolver
      type [ShowType], null: true

      def resolve
        Show.all_shows
      end
    end
  end
end
