class TripsController < ApplicationController
    include CalendarAccess

    def index
    # List all resources in the database
    # GET /resource
    end

    def new
    # Create new resource in the database
    # GET /resource/new
    end

    def create
        trip = Trip.new
        trip.name = params[:trip_name]
        trip.location = params[:location]
        trip.start_date = DateTime.parse(params[:start_date])
        trip.end_date = DateTime.parse(params[:end_date])
        trip.user_id = current_user.id
        trip.save

        # Create traveller
        traveller = Traveller.new
        traveller.trip_id = trip.id
        traveller.user_email = current_user.email
        traveller.existing_user = true
        traveller.accepted_invite = true
        traveller.save

        # Create calendar
        calendar = create_calendar(trip.name)
        trip.calendar_id = calendar.id
        trip.save

        redirect_to "/trips/#{trip.id}/travellers"
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
        @trip = Trip.find(params[:id])
        render :travellers
    end

    def calendar
        @trip = Trip.find(params[:id])
        render :trip_calendar
    end

    def calendar_new
        @place = Place.find(params[:place_id])
        @trip = Trip.find(params[:id])
        render :new_event
    end
end