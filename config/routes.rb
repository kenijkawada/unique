Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  resources :users, only: [:index, :show]

  devise_for :comments

  root 'posts#index'

  resources :relationships, only: [:create, :destroy]

  resources :posts

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
