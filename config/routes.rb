Rails.application.routes.draw do

  resources :hikes, only: [:index, :show, :create, :update, :destroy]
  resources :seeds, only: [:destroy]

end
