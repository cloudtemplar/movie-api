# frozen_string_literal: true

require 'rails_helper'


RSpec.describe 'graphql/mutation/catalogAddMovie' do
  let(:file_path) { __FILE__ }

  let(:variables) do
    {
      input: {
        movies_api_id: movies_api_id
      }
    }
  end
  let(:movies_api_id) { 'tt0110912' }

  describe 'result' do
    it 'adds movie to the catalog' do
      expect(result).to eq 'gowno'
    end
  end
end
