class Api::PlacesController < ApplicationController
    def index
        # Show all places for this trip with 
        # UPDATE THIS TO ALSO SHOW VOTES
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
        @results = JSON.parse(@results)["candidates"][0]
        
        

        place = Place.new
        place.name = @results["name"]
        place.trip_id = params[:trip_id]
        place.user_id = current_user.id
        place.formatted_address = @results["formatted_address"]
        place.longitude = @results["geometry"]["location"]["lat"]
        place.latitude = @results["geometry"]["location"]["lng"]
        place.rating = @results["rating"]
        place.establishment_type = @results["types"]
        place.save


        render json: place
    end

    def show
        # Show specific place
        render json: Place.where(id: params[:id])
    end

    def delete
        # delete the place from the trip, based on the place_id
        Place.delete_by(id: params[:id])
    end
end
