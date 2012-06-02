ThinFile::Application.routes.draw do
  match '/file' => "home#index"
end
