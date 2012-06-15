require 'api_constraints'

ThinFile::Application.routes.draw do
  scope '/file' do
    root :to => "home#index"

    resources :pictures
    resources :documents

    namespace :api, defaults: {format: 'json'} do
      namespace :v1 do
        resources :pictures
        resources :documents
      end
    end
  end
end
