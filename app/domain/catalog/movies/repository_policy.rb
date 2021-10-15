# frozen_string_literal: true

module Catalog
  module Movies
    class RepositoryPolicy < ApplicationPolicy
      relation_scope do |relation|
        next relation if user.cinema_owner?

        relation.none
      end

      def add?
        user.cinema_owner?
      end
    end
  end
end
