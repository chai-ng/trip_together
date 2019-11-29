class Api::TripsController < ApplicationController
    include CalendarAccess

    def index
    # get all trips_id where the current user is a traveller in
    render json: Trip.where(id: Traveller.where(user_email: current_user.email).select('trip_id'))
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

        # redirect_to "/trips/#{trip.id}/travellers"
        render json: trip
    end

    def show
        render json: Trip.find_by(id: params[:id])
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
        Trip.delete_by(id: params[:id])
    end
end
