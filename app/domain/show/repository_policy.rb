# frozen_string_literal: true

module Show
  class RepositoryPolicy < ApplicationPolicy
    def create?
      user.cinema_owner?
    end

    def update?
      user.cinema_owner?
    end
  end
end
