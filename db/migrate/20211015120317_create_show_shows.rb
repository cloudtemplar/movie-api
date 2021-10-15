class CreateShowShows < ActiveRecord::Migration[6.1]
  def change
    create_table :show_shows, id: :uuid do |t|
      t.string :catalog_movie_id, null: false
      t.string :ticket_price
      t.string :show_time

      t.index [:catalog_movie_id]

      t.timestamps
    end
  end
end
