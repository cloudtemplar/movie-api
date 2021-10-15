# frozen_string_literal: true

module Rating
  module Graphql
    module Mutations
      def self.included(base_class)
        base_class.instance_eval do
          field(:rating_rate_movie, mutation: Rating.graphql.rate_movie)
        end
      end
    end
  end
end
