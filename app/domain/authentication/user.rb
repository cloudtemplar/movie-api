# frozen_string_literal: true

module Authentication
  class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    enum role: %i[cinema_owner movie_goer]
    after_initialize :set_default_role, if: :new_record?

    def set_default_role
      self.role ||= :movie_goer
    end
  end
end
