class Api::PlacesController < ApplicationController
    def index
    # List all resources in the database
    # GET /resource
    render json: Place.all
    end

    def search
        searchstring = params[:searchstring]
        uri = URI("https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=#{searchstring}&inputtype=textquery&fields=type,photos,formatted_address,name,rating,opening_hours,geometry&key=#{ENV["GOOGLE_API_KEY"]}")
        @results = Net::HTTP.get(uri) 
        render json: @results
    end

    def new
    # Create new resource in the database
    # GET /resource/new
        searchstring = params[:searchstring]
        uri = URI("https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=#{searchstring}&inputtype=textquery&fields=type,photos,formatted_address,name,rating,opening_hours,geometry&key=#{ENV["GOOGLE_API_KEY"]}")
        @results = Net::HTTP.get(uri) 
        @results = JSON.parse(@results)
        
        place = Place.new
        place.name = @results["candidates"][0]["name"]
        place.trip_id = 1
        place.user_id = 5
        place.longitude = @results["candidates"][0]["geometry"]["location"]["lat"]
        place.latitude = @results["candidates"][0]["geometry"]["location"]["lng"]
        place.save
        
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
