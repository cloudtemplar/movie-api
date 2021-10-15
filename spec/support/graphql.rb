# frozen_string_literal: true

RSpec.shared_context 'graphql test' do
  subject(:result) do
    current_user
      .api_client(token_auth: token_auth)
      .post('/graphql', query: query, variables: prepared_variables)
      .body
      .deep_transform_keys { |key| key.underscore.to_sym }
  end
end

RSpec.configure do |config|
  config.include_context('graphql test', type: :graphql)
end
