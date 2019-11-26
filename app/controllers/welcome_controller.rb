class WelcomeController < ApplicationController
    def index
        uri = URI("https://www.googleapis.com/calendar/v3/users/me/calendarList?access_token=#{ENV["GCAL_ACCESS_TOKEN"]}")
        @calendars = Net::HTTP.get(uri) 
        @calendars = JSON.parse(@calendars)

        render :index
    end
end
