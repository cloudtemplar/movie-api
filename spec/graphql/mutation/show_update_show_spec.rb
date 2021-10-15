# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/spec/support/graphql"

RSpec.describe 'graphql/mutation/showUpdateShow' do
  include_context 'graphql test'

  let(:query) do
    <<-GRAPHQL
      mutation($input: UpdateShowInput!) {
        showUpdateShow(input: $input) {
          show {
            id
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
        show_id: show_id,
        ticket_price: ticket_price,
        show_time: show_time
      }
    }
  end
  let(:show) { FactoryBot.create(:show_show, catalog_movie_id: catalog_id) }
  let(:show_id) { show.id }
  let(:catalog_id) { catalog_movie.id }
  let(:ticket_price) { '$10' }
  let(:show_time) { '2021-10-15T21:37:00' }
  let(:catalog_movie) { FactoryBot.create(:catalog_movie) }

  let(:expected_response) do
    { data: { show_update_show: { show: { catalog_movie_id: catalog_id,
                                          id: show_id,
                                          show_time: show_time,
                                          ticket_price: ticket_price} } } }
  end

  describe 'result' do
    context 'when cinema owner' do
      context 'when show exists' do
        it 'responds with show details' do
          expect(result).to eq expected_response
        end

        it 'updates show' do
          expect { result }.to change { show.reload.ticket_price }.from('$11').to('$10')
        end
      end

      context 'when show does not exists' do
        let(:show_id) { 'foo' }

        it 'returns error' do
          expect { result }.to raise_error Show::PublicApi::ShowNotFound
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
