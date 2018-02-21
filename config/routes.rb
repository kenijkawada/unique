Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users 
  resources :users, only: [:index, :show]
  root 'users#top'
  resources :relationships, only: [:create, :destroy]

  resources :posts do
    resources :comments
  end
  resources :conversations do
    resources :messages
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
