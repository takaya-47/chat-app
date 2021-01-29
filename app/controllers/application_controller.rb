class ApplicationController < ActionController::Base
  before_action :authenticate_user! # ログインしていない場合はログイン画面にリダイレクトさせるメソッド。deviseにより事前定義されている。
  before_action :configure_pertmitted_parameters, if: :devise_controller?

  private
    def configure_pertmitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
