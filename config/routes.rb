# frozen_string_literal: true

Rails.application.routes.draw do

  api_version(module: 'V1', path: { value: 'v1' }) do
    resources :cities, only: :index
    resources :companies, only: :index
    resources :people, only: %i[index show]
  end

  get '/api' => redirect('/apidocs/index.html?url=/apidocs/api-docs.json')
end
