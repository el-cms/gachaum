Rails.application.routes.draw do
  root to: 'logs#index'
  resources :logs
  resources :cards
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
