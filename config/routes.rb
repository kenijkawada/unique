Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, :only => [:index, :show]
  root 'posts#index'

  resources :posts

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
