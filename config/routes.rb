Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :introductions, only: [:new, :edit,:create, :destroy]

  devise_for :users
  resources :users, only: [:show] do
    get '/followed', to: 'users#followed'
    get '/follower', to: 'users#follower'
  end
  root 'users#top'
  resources :relationships, only: [:create, :destroy]

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  resources :conversations do
    resources :messages
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
