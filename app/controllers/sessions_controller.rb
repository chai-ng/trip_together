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
      end
  
    #   session[:user] = Marshal.dump user
      session[:user] = user.id
      redirect_to root_path
    end

    # # Use WebUserAuthorizer
    # client_id = Google::Auth::ClientId.new(
    #   ENV["GOOGLE_CLIENT_ID"],
    #   ENV["GOOGLE_CLIENT_SECRET"]
    # )

    # token_store
    # authorizer = Google::Auth::WebUserAuthorizer.new(

    # )

    # Create WebUserAuthorizer to authorize other things

    # def calendar
    #   # Initialize calendar
    #   Calendar = Google::Apis::CalendarV3
    #   calendar = Google::CalendarService.new
      
    #   # Authenticate calendar (need to find way to store access token securely)
    #   # Method 1 https://github.com/googleapis/google-api-ruby-client
    #   calendar.authorization = Google::Auth::ServiceAccountCredentials.make_creds(
    #     # content-api-key.json
    #     scope: 'https://www.googleapis.com/auth/calendar'
    #   )

    #   # Method 2 https://github.com/googleapis/google-api-ruby-client/blob/e3e97668b4ff7a6787295ef2597585f21e9a9863/samples/web/app.rb
    #   calendar.authorization = credentials_for(Google::Apis::CalendarV3::AUTH_CALENDAR)
    #   calendar_id = 'primary'
    #   @result = calendar.list_events(calendar_id,
    #                             max_results: 10,
    #                              single_events: true,
    #                              order_by: 'startTime',
    #                              time_min: Time.now.iso8601)
    #   render :calendar
    # end

    def destroy
      session.delete :user
    
      redirect_to root_path
    end
end