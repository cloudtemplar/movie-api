class CreateRatingRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :rating_ratings do |t|
      t.string :catalog_movie_id, null: false
      t.string :rating, null: false
      t.string :rater_id, null: false

      t.index [:catalog_movie_id, :rater_id]

      t.timestamps
    end
  end
end
