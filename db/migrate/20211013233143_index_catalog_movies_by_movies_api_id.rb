class IndexCatalogMoviesByMoviesApiId < ActiveRecord::Migration[6.1]
  def change
    add_index :catalog_movies, :movies_api_id, unique: true
  end
end
