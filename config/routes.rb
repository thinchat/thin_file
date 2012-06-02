ThinFile::Application.routes.draw do
  scope '/file' do
    root :to => "home#index"
  end
end
