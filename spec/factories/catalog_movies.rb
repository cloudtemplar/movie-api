# frozen_string_literal: true

FactoryBot.define do
  factory :catalog_movie, class: 'Catalog::Movies::Repository' do
    title { 'Pulp Fiction' }
    director { 'Quentin Tarantino' }
    imdb_id { 'tt0110912' }
  end
end
