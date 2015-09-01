Rails.application.routes.draw do
  resources :project_proposals
  devise_for :users
  root 'welcomes#index'
  resources :users
  resources :posts do
  	member do
  		get "like", to: "posts#upvote"
  	end
  end

  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
end
