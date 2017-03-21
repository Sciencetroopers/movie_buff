Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies
  resources :searches

  get 'profiles/profile'
  get 'profiles/favourites'
  root 'movies#index'
end
