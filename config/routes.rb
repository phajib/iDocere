Rails.application.routes.draw do

  # -----------------DEVISE-----------------
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions',
                                    registrations: 'users/registrations', confirmations: 'users/confirmations' }
  
  
  # -----------------RESOURCES-----------------
  resources :resources do
    collection do
      get 'search'
      get 'last_weeks'
    end
    resources :messages, except: [:show, :index] #do
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
  # When user confirms account, sent to this action           update via patch with this route
    put '/user/confirmation' => 'users/confirmations#update', :via => :patch, :as => :update_user_confirmation
  end

  root 'home#index'
end
