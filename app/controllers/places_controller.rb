class PlacesController < ApplicationController
    def index
    # List all resources in the database
    # GET /resource

        @trip_name = Trip.name

        # @places = Place.all 

        # <% @places.each do |place| %>
        #     <h1><%= place.name %></h1>
        # <%end%>

        # @votes = Vote.type

        # @count = 0
        # if Vote.type == Vote.type["upvote"]
        #     @count = @count + 1
        # elsif Vote.type == Vote.type["downvote"]
        #     @count = count - 1    
        # end

        
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

    # get search input
    # get auto complete based on trip.name (so it will search in that region)
    # when button is clicked place is added to the map and added to the Place table (create new, save)

    # https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=Museum%20of%20Contemporary%20Art%20Australia&inputtype=textquery&fields=type,photos,formatted_address,name,rating,opening_hours,geometry&key=AIzaSyCFg67CkYdQfBML3P965eOV46EFMuCijj4

    https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=Museum%20of%20Contemporary%20Art%20Australia&inputtype=textquery&fields=type,photos,formatted_address,name,rating,opening_hours,geometry&key=ENV[“GOOGLE_API_KEY”]

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
