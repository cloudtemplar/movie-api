class CreateCatalogMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :catalog_movies, id: :uuid do |t|
      t.string :title, null: false
      t.string :movies_api_id, null: false

      t.timestamps
    end
  end
end
