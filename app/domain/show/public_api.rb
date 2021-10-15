# frozen_string_literal: true

module Show
  module PublicApi
    class ShowNotFound < StandardError; end

    def graphql
      Show::Graphql
    end

    def all_shows
      Repository.all
    end

    def find_show(show_id)
      Repository.find(show_id)
    rescue ActiveRecord::RecordNotFound
      raise ShowNotFound
    end

    def create_show(catalog_id, ticket_price, show_time)
      catalog_movie = find_catalog_movie(catalog_id)

      Show::Repository.create(
        catalog_movie_id: catalog_movie.id,
        ticket_price: ticket_price,
        show_time: show_time
      )
    end

    def update_show(show_id, ticket_price, show_time)
      found_show = find_show(show_id)

      found_show.tap do |show|
        show.update(
          ticket_price: ticket_price,
          show_time: show_time
        )
      end
    end

    private

    def find_catalog_movie(catalog_id)
      Catalog::Movies.find_movie(catalog_id)
    end
  end
end
