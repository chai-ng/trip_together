class ApplicationController < ActionController::Base
    require 'googleauth'
    require 'googleauth/stores/redis_token_store'
    require 'google/apis/calendar_v3'

    helper_method :logged_in?, :current_user, :credentials_for
    
    def logged_in?
        session.has_key? :user
    end
    
    def current_user
        # Marshal.load session[:user] if logged_in?
        User.find_by(id: session[:user]) if logged_in?
    end

    def credentials_for(scope)
        client_id = Google::Auth::ClientId.new(ENV['GOOGLE_CLIENT_ID'],ENV['GOOGLE_CLIENT_SECRET'])
        token_store = Google::Auth::Stores::RedisTokenStore.new(redis: Redis.new)
        authorizer = Google::Auth::WebUserAuthorizer.new(client_id, scope, token_store)
        user_id = current_user.uid
        redirect_to "/" if user_id.nil?
        credentials = authorizer.get_credentials(user_id, request)
        if credentials.nil?
          redirect authorizer.get_authorization_url(login_hint: user_id, request: request)
        end
        credentials
    end

    def resize(url, width)
        url.sub(/s220/, sprintf('s%d', width))
    end

    def current_trip_id
        params[:id]
    end
end
