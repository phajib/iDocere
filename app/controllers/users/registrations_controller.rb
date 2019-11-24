class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # adds fields to sign up process
  private

    def sign_up_params 
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def account_update_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
    end

end
