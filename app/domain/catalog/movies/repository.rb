# frozen_string_literal: true

module Catalog
  module Movies
    class Repository < ApplicationRecord
      self.table_name = 'catalog_movies'
    end
  end
end
