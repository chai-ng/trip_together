class TripsController < ApplicationController
    def index
    # List all resources in the database
    # GET /resource
    end

    def new
    # Create new resource in the database
    # GET /resource/new
    end

    def create
    # Creating a new resource in the database
    # POST /resource
    end

    def show
    # Show specific trip from /trips/:id
    # GET /resource/:id
    end

    def edit
    # Show HTML form to edit a specific resource
    # GET /resource/:id/edit
    end

    def update
    # Update a specific resource in the database
    # GET /resource/:id
    end

    def delete
    # Destory a specific resource in the database from /trips/:id
    # DELETE /resource/:id
    end

    def travellers
        @travellers = Traveller.where(trip_id: params[:id])
        render :travellers
    end

    def calendar
        # check auth token is still valid
        if current_user.expire_by.localtime < Time.now
            redirect_to "/logout"
        end

        # get events based on trip calendar
        calendar_id = Trip.where(id: params[:id])[0].calendar_id
        uri = URI("https://www.googleapis.com/calendar/v3/calendars/#{calendar_id}/events?access_token=#{current_user.access_token}")
        @events = Net::HTTP.get(uri)

        # check that event calendar exists
        if @events == "Not Found"
        else 
            @events = JSON.parse(@events)
        end
        
        # Filter out all day events
        @accommodations = @events["items"].filter {|event| event["start"]["date"].class != NilClass}
        @accommodations = @accommodations.filter {|event| DateTime.parse(event["start"]["date"]) > Time.now} 
        
        # Filter and return only events happening past today
        @events = @events["items"].filter {|event| event["start"]["dateTime"].class != NilClass} 
        @events = @events.filter {|event| DateTime.parse(event["start"]["dateTime"]) > Time.now} 

        render :trip_calendar
    end

    def authcalendar
        calendar = Google::Apis::CalendarV3::CalendarService.new
        calendar.authorization = credentials_for(Google::Apis::CalendarV3::AUTH_CALENDAR)
        calendar_id = Trip.find_by(id: params[:id]).calendar_id
        @result = calendar.list_events(calendar_id,
                                        max_results: 10,
                                        single_events: true,
                                        order_by: 'startTime',
                                        time_min: Time.now.iso8601)
        render :auth_calendar
    end
end