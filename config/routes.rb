Rails.application.routes.draw do
  devise_for :users
  root 'welcomes#index'
  resources :posts
  resources :users

  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
end
