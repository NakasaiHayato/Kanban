class ApplicationController < ActionController::Base
  # ログイン済ユーザーのみアクセスを許可する
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # CSRF対策
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    # サインアップするときにカラムを許可する
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end


end
