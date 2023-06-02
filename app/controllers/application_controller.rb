class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    unless params[:user].nil?
      my_params = [:email, :avatar, :password, :password_confirmation]
      # binding.pry
      params.require(:user).permit(my_params)
      devise_parameter_sanitizer.permit(:sign_up, keys: my_params)
    end

    # params[:user].permit(my_params)

    #

    # devise_parameter_sanitizer.permit(:new, keys: {user: my_paramss})
    # devise_parameter_sanitizer.permit(:create, keys: {user: my_paramss})
    # devise_parameter_sanitizer.permit(:account_update, keys: {user: my_paramss})

  end

end
