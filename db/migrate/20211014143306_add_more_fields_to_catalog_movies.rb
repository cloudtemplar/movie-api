# frozen_string_literal: true

class AddMoreFieldsToCatalogMovies < ActiveRecord::Migration[6.1]
  API_RESPONSE_FIELDS = %i[
    year rated released runtime genre director writer actors plot language country awards
    poster metascore imdb_rating imdb_votes dvd box_office production website
  ].freeze

  def change
    API_RESPONSE_FIELDS.each do |field|
      add_column :catalog_movies, field, :string
    end
    add_column :catalog_movies, :ratings, :jsonb, default: []
    rename_column :catalog_movies, :movies_api_id, :imdb_id
  end
end
