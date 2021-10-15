# frozen_string_literal: true

class BaseResolver < GraphQL::Schema::Resolver
  include ActionPolicy::Behaviour
end
