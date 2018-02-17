Rails.application.routes.draw do
  devise_for :users
  root 'blogs#index'
  
  resources :posts

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
