class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user
    
    def logged_in?
        session.has_key? :user
    end
    
    def current_user
        # Marshal.load session[:user] if logged_in?
        User.find_by(id: session[:user]) if logged_in?
    end

    def authorize
        client_id = Google::Auth::ClientId.from_file CREDENTIALS_PATH
        token_store = Google::Auth::Stores::FileTokenStore.new file: TOKEN_PATH
        authorizer = Google::Auth::UserAuthorizer.new client_id, SCOPE, token_store
        user_id = "default"
        credentials = authorizer.get_credentials user_id
        
        if credentials.nil?
          url = authorizer.get_authorization_url base_url: OOB_URI
          puts "Open the following URL in the browser and enter the " \
               "resulting code after authorization:\n" + url
          code = gets
          credentials = authorizer.get_and_store_credentials_from_code(
            user_id: user_id, code: code, base_url: OOB_URI
          )
        end
        credentials
      end
end
