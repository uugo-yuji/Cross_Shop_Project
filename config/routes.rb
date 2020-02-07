Rails.application.routes.draw do
  # devise_for :users 
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root 'boards#index'
  root 'homes#index'
  resources :boards
  resources :comments, only: %i[create destroy]
end
