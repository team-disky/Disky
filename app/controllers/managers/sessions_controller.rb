# frozen_string_literal: true

class Managers::SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
    manager_products_path
  end

  def after_sign_out_path_for(resource)
    new_manager_session_path
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
     super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
   def destroy
    super
    flash[:destroy] = "お疲れ様でした！"
   end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
