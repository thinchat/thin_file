require 'api_constraints'

ThinFile::Application.routes.draw do
  scope '/file' do
    root :to => "home#index"
  end

  resources :pictures
  resources :documents

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :pictures
      resources :documents
    end
  end
end
