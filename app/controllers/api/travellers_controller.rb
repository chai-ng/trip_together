class Api::TravellersController < ApplicationController
    def index
        # return me all travellers associated with this trip
        render json: Traveller.where(trip_id: params[:trip_id])
    end

    def create
        traveller = Traveller.new
        traveller.trip_id = params[:trip_id]
        traveller.user_email = params[:user_email]
        traveller.existing_user = User.where(email: params[:user_email]).count > 0
        traveller.accepted_invite = true
        traveller.user_id = current_user.id
        traveller.save
    end

    def delete
        # when traveller leaves the tri
        Traveller.delete_by(id: params[:id])
    end
end
