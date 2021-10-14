# frozen_string_literal: true

MOVIES = {
  'The Fast and the Furious' =>	'tt0232500',
  '2 Fast 2 Furious' => 'tt0322259',
  'The Fast and the Furious: Tokyo Drift' => 'tt0463985',
  'Fast & Furious' =>	'tt1013752',
  'Fast Five' => 'tt1596343',
  'Fast & Furious 6' =>	'tt1905041',
  'Furious 7' => 'tt2820852',
  'The Fate of the Furious' => 'tt4630562'
}.freeze

# I know I should not rely on calling external APIs when seeding my data.
# This is a conscious decision to use a shortcut like that.

MOVIES.each do |_title, omdb_id|
  print '.'
  movies_api_response = Catalog::Services::OmdbClient
                        .movie(omdb_id)
                        .deep_transform_keys { |k| k.underscore.to_sym }
                        .except(:type, :response)

  Catalog::Movies::Repository.create(**movies_api_response)
end
