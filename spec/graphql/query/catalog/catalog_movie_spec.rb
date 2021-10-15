# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/spec/support/graphql"

RSpec.describe 'graphql/query/catalog/movie' do
  include_context 'graphql test'

  let(:query) do
    <<-GRAPHQL
      query($catalogMovieId: String!) {
        catalog(catalogMovieId: $catalogMovieId) {
          title
          director
          userRating {
            rating
          }
        }
      }
    GRAPHQL
  end
  let(:variables) { { catalog_movie_id: catalog_movie_id } }
  let(:result) { execute_graphql.call(query, variables) }
  let(:catalog_movie_id) { catalog_movie.id }
  let(:catalog_movie) { FactoryBot.create(:catalog_movie) }
  let(:rating) { 4 }

  before do
    Rating.rate_movie(catalog_movie_id, rating, current_user.id)
  end

  describe 'result' do
    let(:expected_response) do
      { data: { catalog: [{ director: 'Quentin Tarantino', title: 'Pulp Fiction',
                            user_rating: { rating: '4' } }] } }
    end

    it 'returns catalog movie with rating' do
      expect(result).to eq expected_response
    end
  end
end
