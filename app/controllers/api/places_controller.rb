class Api::PlacesController < ApplicationController
    def index
    # List all resources for a given trip_id
    render json: Place.where(trip_id: params[:trip_id])
    end

    def search
        searchstring = params[:searchstring]
        uri = URI("https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=#{searchstring}&inputtype=textquery&fields=type,photos,formatted_address,name,rating,opening_hours,geometry&key=#{ENV["GOOGLE_API_KEY"]}")
        @results = Net::HTTP.get(uri) 
        render json: @results
    end

    def create
        searchstring = params[:searchstring]
        uri = URI("https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=#{searchstring}&inputtype=textquery&fields=type,photos,formatted_address,name,rating,opening_hours,geometry&key=#{ENV["GOOGLE_API_KEY"]}")
        @results = Net::HTTP.get(uri) 
        @results = JSON.parse(@results)
        
        place = Place.new
        place.name = @results["candidates"][0]["name"]
        place.trip_id = params[:trip_id]
        place.user_id = current_user.id
        place.longitude = @results["candidates"][0]["geometry"]["location"]["lat"]
        place.latitude = @results["candidates"][0]["geometry"]["location"]["lng"]
        place.save
        
    end

    def show
        render json: Place.where(id: params[:id])
    end

    def edit
    end

    def update
    end

    def delete
    # Destory a specific resource in the database from /trips/:id
    # DELETE /resource/:id
    end
end
