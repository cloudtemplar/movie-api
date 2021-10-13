# frozen_string_literal: true

module Catalog
  module Movies
    module PublicApi
      def catalog
        Repository.all
      end

      def add_movie(title, movies_api_id)
        Repository.create(title: title, movies_api_id: movies_api_id)
      end
    end
  end
end
