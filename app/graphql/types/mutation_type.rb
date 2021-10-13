# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    include Catalog.graphql.mutations
  end
end
