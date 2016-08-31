Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pics, only: ["show"]
  root 'home#index'
  get '/auth/instagram', as: :instagram_login
  get '/auth/instagram/callback', to: 'sessions#create'
  delete '/logout', to: "sessions#destroy"
  get '/user_recent_media', to: 'users#show'
  get 'user_media_feed', to: 'feed#index'

end
