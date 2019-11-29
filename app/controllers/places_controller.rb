class PlacesController < ApplicationController
    def index
    # List all resources in the database
    # GET /resource

        @trip = Trip.find(params[:id])
        
        @trip_header = "Are you rendering"

    end

    def new
    # Create new resource in the database
    # GET /resource/new

    @place = Place.find(1)

    # get search input
    # get auto complete based on trip.name (so it will search in that region)
    # when button is clicked place is added to the map and added to the Place table (create new, save)i

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
end
