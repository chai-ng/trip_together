class User < ApplicationRecord
    # require 'google/apis/calendar_v3'
    # require 'googleauth'
    # require 'googleauth/stores/redis_token_store'
    # require 'date'

    # def credentials_for
    #     client_id = Google::Auth::ClientId.new(ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'])
    #     scope = Google::Apis::CalendarV3::AUTH_CALENDAR
    #     token_store = Google::Auth::Stores::RedisTokenStore.new(redis: Redis.new)
        
    #     authorizer = Google::Auth::WebUserAuthorizer.new(client_id, scope, token_store)
    #     user_id = session.has_key? :user
    #     redirect LOGIN_URL if user_id.nil?
        
    #     credentials = authorizer.get_credentials(uid, request)
    #     if credentials.nil?
    #       redirect authorizer.get_authorization_url(login_hint: uid, request: request)
    #     end
    #     credentials
    #   end

    # def get_calendar
    #     calendar = Google::Apis::CalendarV3::CalendarService.new
    #     calendar.authorization = credentials_for()
    #     calendar_id = 'primary'
    #     @result = calendar.list_events(calendar_id,
    #                                     max_results: 10,
    #                                     single_events: true,
    #                                     order_by: 'startTime',
    #                                     time_min: Time.now.iso8601)
    #     return @result
    # end
end
