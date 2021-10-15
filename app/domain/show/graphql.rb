# frozen_string_literal: true

module Show
  module Graphql
    def self.resolver
      Resolver
    end

    def self.mutations
      Show::Graphql::Mutations
    end

    def self.create_show
      Graphql::CreateShow
    end

    def self.update_show
      Graphql::UpdateShow
    end
  end
end
