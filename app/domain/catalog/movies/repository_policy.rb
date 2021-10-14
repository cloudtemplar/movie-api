# frozen_string_literal: true

module Catalog
  module Movies
    class RepositoryPolicy < ApplicationPolicy
      relation_scope do |relation|
        next relation
      end

      def add?
        user.cinema_owner?
      end
    end
  end
end
