# frozen_string_literal: true

module Catalog
  module Movies
    module Graphql
      class MovieType < ::Types::BaseObject
        field :id, String, null: false
        field :title, String, null: false
        field :movies_api_id, String, null: false
      end
    end
  end
end
