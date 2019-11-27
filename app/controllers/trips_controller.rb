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
        calendar = Google::Apis::CalendarV3::CalendarService.new
        calendar.authorization = credentials_for(Google::Apis::CalendarV3::AUTH_CALENDAR)
        calendar_id = Trip.find_by(id: params[:id]).calendar_id
        @result = calendar.list_events(calendar_id,
                                        max_results: 10,
                                        single_events: true,
                                        order_by: 'startTime',
                                        time_min: Time.now.iso8601)
        render :trip_calendar
    end
end