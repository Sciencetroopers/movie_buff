Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies do
    resources :reviews
  end

  resources :searches

  get '/profile', to: "pages#profile"
  get '/favourites', to: "pages#favourites"
  root 'movies#index'
end
