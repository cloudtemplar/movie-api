# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/spec/support/graphql"

RSpec.describe 'graphql/mutation/showCreateShow' do
  include_context 'graphql test'

  let(:query) do
    <<-GRAPHQL
      mutation($input: CreateShowInput!) {
        showCreateShow(input: $input) {
          show {
            catalogMovieId
            ticketPrice
            showTime
          }
        }
      }
    GRAPHQL
  end
  let(:result) { execute_graphql.call(query, variables) }

  let(:variables) do
    {
      input: {
        catalog_movie_id: catalog_id,
        ticket_price: ticket_price,
        show_time: show_time
      }
    }
  end
  let(:catalog_id) { catalog_movie.id }
  let(:ticket_price) { '$10' }
  let(:show_time) { '2021-10-15T21:37:00' }
  let(:catalog_movie) { FactoryBot.create(:catalog_movie) }

  let(:expected_response) do
    { data: { show_create_show: { show: { ticket_price: ticket_price,
                                          catalog_movie_id: catalog_id,
                                          show_time: show_time } } } }
  end

  describe 'result' do
    context 'when cinema owner' do
      context 'when movie exists in catalog' do
        it 'responds with show details' do
          expect(result).to eq expected_response
        end

        it 'creates new show' do
          expect { result }.to change { Show.all_shows.count }.by(1)
        end
      end

      context 'when the movie does not exist in catalog' do
        let(:catalog_id) { 'foo' }

        it 'returns error' do
          expect { result }.to raise_error Catalog::Movies::PublicApi::CatalogMovieNotFound
        end
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
