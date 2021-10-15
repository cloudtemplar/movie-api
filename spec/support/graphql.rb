# frozen_string_literal: true

RSpec.shared_context 'graphql test' do
  let(:execute_graphql) do
    lambda do |query, variables|
      current_user
        .api_client
        .post('/graphql', query: query, variables: prepared_variables)
        .body
        .deep_transform_keys { |key| key.underscore.to_sym }
    end
  end

  let(:prepared_variables) { variables.deep_transform_keys { |key| key.to_s.camelize(:lower) } }

  let(:current_user) do
    TestUser.cinema_owner
  end
end
