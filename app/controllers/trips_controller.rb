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
        
        # trip = Trip.new
        # trip.name = params[:trip-name]
        # trip.start_date = params[:start-date]
        # trip.end_date = params[:]
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
end