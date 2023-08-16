class ApplicationController < ActionController::Base
  require "openai"
  require 'dotenv'
  Dotenv.load
    
    before_action :set_common_variable


    protect_from_forgery with: :exception

    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

    private
    
      # APIキーを設定
    def set_common_variable
      @client = OpenAI::Client.new(access_token: ENV["OPENAI_ACCESS_TOKEN"])
    end  
end
