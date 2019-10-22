Rails.application.routes.draw do
  resources :reviews
  resources :users do resources :reservations
  end
  resources :reservations
  resources :restaurants
  root 'users#new'

  get 'login' => "sessions#new"
  post 'sessions' => "sessions#create"
  get 'logout' => "sessions#destroy"
  get 'location' =>"restaurants#location"
  post 'locations' =>"restaurants#city"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end