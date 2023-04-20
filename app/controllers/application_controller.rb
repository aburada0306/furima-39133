class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :basic_auth

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :encrypted_password, :name, :chinese_first, :chinese_last, :kana_first, :kana_last, :birth])
  end

  #def basic_auth
   # authenticate_or_request_with_http_basic do |username, password|
   # username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"] # source ~/.zshrc を入力後のターミナルじゃないとbasic認証を突破できない。
    #end
 # end
end