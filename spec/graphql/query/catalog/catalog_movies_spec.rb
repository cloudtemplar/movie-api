# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/spec/support/graphql"

RSpec.describe 'graphql/query/catalog/movies' do
  include_context 'graphql test'

  let(:query) do
    <<-GRAPHQL
      query {
        catalog {
          title
          imdbId
        }
      }
    GRAPHQL
  end
  let(:result) { execute_graphql.call(query, variables) }

  let(:variables) { {} }

  before do
    FactoryBot.create(:catalog_movie)
  end

  describe 'result' do
    context 'when cinema owner' do
      let(:expected_response) do
        { data: { catalog: [{ imdb_id: 'tt0110912', title: 'Pulp Fiction' }] } }
      end

      it 'returns catalog movies' do
        expect(result).to eq expected_response
      end
    end

    context 'when movie goer' do
      let(:current_user) { TestUser.movie_goer }
      let(:expected_response) do
        { data: { catalog: [] } }
      end

      it 'returns empty response' do
        expect(result).to eq expected_response
      end
    end
  end
end
