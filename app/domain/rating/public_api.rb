# frozen_string_literal: true

module Rating
  module PublicApi
    def graphql
      Rating::Graphql
    end

    def user_rating(rater_id, catalog_movie_id)
      Repository.find_by(rater_id: rater_id, catalog_movie_id: catalog_movie_id)
    end

    def rate_movie(catalog_id, rating, rater_id)
      catalog_movie_exists?(catalog_id)

      Repository.create(
        catalog_movie_id: catalog_id,
        rating: rating,
        rater_id: rater_id
      )
    end

    private

    def catalog_movie_exists?(catalog_id)
      Catalog::Movies.find_movie(catalog_id)
    end
  end
end
