# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/spec/support/graphql"

RSpec.describe 'graphql/mutation/ratingRateMovie' do
  include_context 'graphql test'

  let(:query) do
    <<-GRAPHQL
      mutation($input: RateMovieInput!) {
        ratingRateMovie(input: $input) {
          raterId
          catalogMovieId
          rating
        }
      }
    GRAPHQL
  end
  let(:result) { execute_graphql.call(query, variables) }

  let(:variables) do
    {
      input: {
        catalog_movie_id: catalog_id,
        rating: rating
      }
    }
  end
  let(:catalog_id) { catalog_movie.id }
  let(:catalog_movie) { FactoryBot.create(:catalog_movie) }
  let(:rating) { 3 }
  let(:expected_response) do
    { data: { rating_rate_movie: { catalog_movie_id: catalog_id, rater_id: current_user.id,
                                   rating: rating } } }
  end

  describe 'result' do
    context 'when movie goer' do
      let(:current_user) { TestUser.movie_goer }

      it 'responds with catalog movie details' do
        expect(result).to eq expected_response
      end

      it 'creates new rating' do
        expect { result }.to change { Catalog::Movies.catalog.count }.by(1)
      end

      context 'when the movie does not exist in catalog' do
        let(:catalog_id) { 'foo' }

        it 'returns error' do
          expect { result }.to raise_error Catalog::Movies::PublicApi::CatalogMovieNotFound
        end
      end
    end
  end
end
