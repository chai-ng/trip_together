class PlacesController < ApplicationController
    def index
    # List all resources in the database
    # GET /resource

        # def voting
        #     if votes type == true
        #         delete vote
        #     else
        #         allow user to vote
        #     end
        # end
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
end
