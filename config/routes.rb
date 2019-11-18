Rails.application.routes.draw do

  # -----------------DEVISE-----------------
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions' }
  
  root 'home#index'
  
  # -----------------RESOURCES-----------------
  resources :resources do
    collection do
      get 'search'
    end
    resources :messages
  end

  resources :messages do
    collection do
      get 'search'
    end
    resources :comments
  end
end
