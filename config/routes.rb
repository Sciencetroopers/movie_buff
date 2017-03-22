Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies do
    member do
      get "like", to: "movies#upvote"
    end
    resources :reviews do
      member do
        get "like", to: "reviews#upvote"
      end
    end
  end

  resources :searches

  get '/profile', to: "pages#profile"
  get '/favourites', to: "pages#favourites"
  root 'movies#index'
end
