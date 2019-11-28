class Api::TripsController < ApplicationController
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
        create_traveller = URI("http://localhost:3000/api/travellers/create?trip_id=#{trip.id}&user_email=#{current_user.email}")
        traveller = Net::HTTP.get(create_traveller)

        # Create calendar
        create_calendar = URI("http://localhost:3000/api/calendar/create?summary=#{trip.name}")
        trip.calendar_id = Net::HTTP.get(create_calendar)
        trip.save

        redirect_to "/trips/#{trip.id}/travellers"
        # render json: trip.id
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
