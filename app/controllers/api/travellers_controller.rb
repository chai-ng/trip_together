class Api::TravellersController < ApplicationController
    def index
        # return me all users associated with this trip
        connection = ActiveRecord::Base.connection.raw_connection
        begin
            connection.prepare('getTravellers', 'SELECT * FROM travellers LEFT OUTER JOIN users ON travellers.user_email = users.email WHERE trip_id = $1')
        rescue
        end
        result = connection.exec_prepared('getTravellers', [params[:trip_id]])
        render json: result
        # render json: User.where(email: Traveller.where(trip_id: params[:trip_id]).select('user_email'))
    end

    def create
        traveller = Traveller.new
        traveller.trip_id = params[:trip_id]
        traveller.user_email = params[:user_email]
        traveller.existing_user = User.where(email: params[:user_email]).count > 0
        traveller.accepted_invite = true
        traveller.save
        render json: traveller
    end

    def delete
        # when traveller leaves the tri
        Traveller.delete_by(id: params[:id])
    end
end
