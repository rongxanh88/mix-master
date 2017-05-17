Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artists do
    resources :songs#, module: :artists
  end

  resources :songs

  resources :playlists
end
