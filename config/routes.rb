# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/api' => redirect('/apidocs/index.html?url=/apidocs/api-docs.json')
end
