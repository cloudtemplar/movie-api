# frozen_string_literal: true

FactoryBot.define do
  factory :show_show, class: 'Show::Repository' do
    catalog_movie_id { SecureRandom.uuid }
    ticket_price { '$11' }
    show_time { '2021-10-15T18:00' }
  end
end
