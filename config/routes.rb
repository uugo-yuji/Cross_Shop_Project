Rails.application.routes.draw do

  get 'homes/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root 'boards#index'
  root 'home#index'
  resources :boards
  resources :comments, only: %i[create destroy]
end
