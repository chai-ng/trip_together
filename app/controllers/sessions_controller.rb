class SessionsController < ApplicationController

    require 'google/apis/calendar_v3'
    require 'googleauth'
    # require 'googleauth/web_user_authorizer'
    # require 'googleauth/stores/redis_token_store'
    # require 'redis'

    # Handle Google OAuth 2.0 login callback.
    #
    # GET /auth/google_oauth2/callback
    def create
      user_info = request.env["omniauth.auth"]
      byebug

      # If user does not exist in Users table, then create new user
      if User.find_by(uid: user_info["uid"]) == nil
        user           = User.new
        user.uid        = user_info["uid"]
        user.first_name      = user_info["info"]["first_name"]
        user.last_name      = user_info["info"]["last_name"]
        user.image_url = user_info["info"]["image"]
        user.email = user_info["info"]["email"]
        user.save
        
      # if user exists, then return user from PSQL
      else
        user = User.find_by(uid: user_info["uid"])
        user.save
      end
  
    #   session[:user] = Marshal.dump user
      session[:user] = user.id
      redirect_to root_path
    end

    def destroy
      session.delete :user
      redirect_to root_path
    end
end