Rails.application.routes.draw do

  resources :hikes, only: [:index, :show, :create, :destroy]

end
