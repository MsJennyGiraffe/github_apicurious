Rails.application.routes.draw do
  root 'home#show'

  resources :users, only: [:show] do
    resources :followers, only: [:index]
    resources :followings, only: [:index]
    resources :repositories, only: [:index]
  end


  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
end
