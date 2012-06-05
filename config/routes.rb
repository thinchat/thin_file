require 'api_constraints'

ThinFile::Application.routes.draw do
  scope '/file' do
    root :to => "home#index"
  end

  resources :pictures

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :pictures
    end
  end
end
