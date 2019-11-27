class Api::CalendarController < ApplicationController
    def get_trip_calendar(trip_id)
        calendar = Google::Apis::CalendarV3::CalendarService.new
        calendar.authorization = credentials_for(Google::Apis::CalendarV3::AUTH_CALENDAR)
        calendar
    end
    
    def index
        # List all resources in the database
        # GET /resource
    end
    
    def create
    end
    
    def show
        # Show specific trip from /trips/:id
        # GET /resource/:id
        calendar = get_trip_calendar(params[:id])
        calendar_id = Trip.find_by(id: params[:id]).calendar_id
        @result = calendar.list_events(calendar_id,
                                        max_results: 10,
                                        single_events: true,
                                        order_by: 'startTime',
                                        time_min: Time.now.iso8601)
        render json: @result
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
end
