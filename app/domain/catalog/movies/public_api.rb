# frozen_string_literal: true

module Catalog
  module Movies
    module PublicApi
      class CatalogMovieNotFound < StandardError; end

      def catalog
        Repository.all
      end

      def find_movie(catalog_id)
        Repository.find(catalog_id)
      rescue ActiveRecord::RecordNotFound
        raise CatalogMovieNotFound
      end

      def add_movie(movie_payload)
        attributes = movie_payload
                     .deep_transform_keys { |k| k.underscore.to_sym }
                     .except(:type, :response)

        Catalog::Movies::Repository.create(**attributes)
      end
    end
  end
end
