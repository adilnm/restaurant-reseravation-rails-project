Rails.application.routes.draw do
  resources :reviews, only:[:new, :create]
  resources :users do resources :reservations
  end
  resources :reservations
  resources :restaurants do resources :reviews, only:[:new, :create]
  end

  root 'reservations#index'

  get 'login' => "sessions#new"
  post 'sessions' => "sessions#create"
  get 'logout' => "sessions#destroy"
  get 'location' =>"restaurants#location"
  post 'locations' =>"restaurants#city"
  get 'list' =>"restaurants#list"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
