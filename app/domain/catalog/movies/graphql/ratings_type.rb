# frozen_string_literal: true

module Catalog
  module Movies
    module Graphql
      class RatingsType < ::Types::BaseObject
        field :source, String, null: false
        field :value, String, null: false
      end
    end
  end
end
