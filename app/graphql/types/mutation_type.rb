# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    include Catalog.graphql.mutations
    include Show.graphql.mutations
    include Rating.graphql.mutations
  end
end
