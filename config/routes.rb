Rails.application.routes.draw do
  devise_for :users
  root 'resources#index'
  
  resources :messages
  resources :resources
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
