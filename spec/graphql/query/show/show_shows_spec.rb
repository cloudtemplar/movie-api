# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/spec/support/graphql"

RSpec.describe 'graphql/query/show/shows' do
  include_context 'graphql test'

  let(:query) do
    <<-GRAPHQL
      query {
        shows {
          showTime
          ticketPrice
          catalogMovieId
        }
      }
    GRAPHQL
  end
  let(:result) { execute_graphql.call(query, variables) }

  let(:variables) { {} }

  let(:expected_response) do
    { data: { shows: [{ catalog_movie_id: show.catalog_movie_id, show_time: show.show_time,
                        ticket_price: show.ticket_price }] } }
  end
  let!(:show) { FactoryBot.create(:show_show) }

  describe 'result' do
    context 'when cinema owner' do
      it 'returns show details' do
        expect(result).to eq expected_response
      end
    end

    context 'when movie goer' do
      let(:current_user) { TestUser.movie_goer }

      it 'returns show details' do
        expect(result).to eq expected_response
      end
    end
  end
end
