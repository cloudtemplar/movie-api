# frozen_string_literal: true

module Rating
  class RepositoryPolicy < ApplicationPolicy
    def rate?
      true
    end
  end
end
