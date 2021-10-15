# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/spec/support/graphql"

RSpec.describe 'graphql/mutation/catalogAddMovie' do
  include_context 'graphql test'

  let(:query) do
    <<-GRAPHQL
      mutation($input: AddMovieInput!) {
        catalogAddMovie(input: $input) {
          movie {
            title
            imdbId
            director
          }
        }
      }
    GRAPHQL
  end
  let(:result) { execute_graphql.call(query, variables) }

  let(:variables) do
    {
      input: {
        movies_api_id: movies_api_id
      }
    }
  end
  let(:movies_api_id) { 'tt0110912' }
  let(:expected_response) do
    { data: { catalog_add_movie: { movie: { director: 'Quentin Tarantino', imdb_id: 'tt0110912',
                                            title: 'Pulp Fiction' } } } }
  end

  describe 'result' do
    context 'when cinema owner' do
      it 'responds with catalog movie details' do
        expect(result).to eq expected_response
      end

      it 'creates new catalog movie' do
        expect { result }.to change { Catalog::Movies.catalog.count }.by(1)
      end
    end

    context 'when movie goer' do
      let(:current_user) { TestUser.movie_goer }

      it 'returns Unauthorized error' do
        expect { result }.to raise_error ActionPolicy::Unauthorized
      end
    end
  end
end
