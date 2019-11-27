class Api::TripsController < ApplicationController
    def index
    # List all resources in the database
    # GET /resource
    render json: Trip.where(user_id: current_user.id)
    end

    def create
        trip = Trip.new
        byebug
        trip.name = params[:trip_name]
        trip.location = params[:location]
        trip.start_date = DateTime.parse(params[:start_date])
        trip.end_date = DateTime.parse(params[:end_date])
        trip.user_id = current_user.id
        trip.save
    end

    def show
    # Show specific trip from /trips/:id
    # GET /resource/:id
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
