class Api::TravellersController < ApplicationController
    include CalendarAccess
    
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

        # add traveller to trip calendar
        calendar_id = Trip.find(params[:trip_id]).calendar_id
        client = get_client()
        new_rule = Google::Apis::CalendarV3::AclRule.new({
            scope: {
                type: 'user',
                value: params[:user_email]
            },
            role: 'writer'
        })
        result = client.insert_acl(calendar_id, new_rule)

        render json: traveller
    end

    def delete
        # when traveller leaves the tri
        Traveller.delete_by(id: params[:id])
    end
end
