Rails.application.routes.draw do

	# root page for the website
	root "projxes#index"

  devise_for :users

  # resources
  resources :messages, only: [:create, :new, :index]
  resources :searches
  resources :relationships,       only: [:create, :destroy]

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :projxes do
  	resources :bscenes
  end

end
