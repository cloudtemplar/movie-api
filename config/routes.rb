# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, class_name: 'Authentication::User'
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?

  post '/graphql', to: 'graphql#execute'
  get '/health', to: 'health#show'
end
