Rails.application.routes.draw do
  resources :reviews
  resources :reservations
  resources :users
  resources :restaurants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
