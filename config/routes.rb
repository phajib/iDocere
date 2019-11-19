Rails.application.routes.draw do

  # -----------------DEVISE-----------------
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions',
                                    registrations: 'users/registrations', confirmations: 'users/confirmations' }
  
  
  # -----------------RESOURCES-----------------
  resources :resources do
    collection do
      get 'search'
    end
    resources :messages #do
    #   collection do
    #     get 'search'
    #   end
    # end
  end

  resources :messages #do
    # collection do
    #   get 'search'
    # end
    # resources :comments
  # end

  as :user do
    put '/user/confirmation' => 'users/confirmations#update', :via => :patch, :as => :update_user_confirmation
  end

  root 'home#index'
end
