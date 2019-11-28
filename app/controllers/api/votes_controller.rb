class Api::VotesController < ApplicationController
    def index
        # return me all the votes associated with a trip_id
        render json: Vote.where(trip_id: params[:trip_id])
    end

    def sum_by_place_and_vote(place_id, vote_type)
        # sum by place_id and vote_type
        Vote.where(place_id: place_id, vote_type: vote_type).count
    end

    def create
        # if Vote.where(place_id: params[:place_id], user_id: current_user.id).count > 0
        #     Vote.where(place_id: params[:place_id], user_id: current_user.id)
        #     # if same vote_type = delete
        #     # if different vote_type = update
        # else
            vote = Vote.new
            vote.place_id = params[:place_id]
            vote.trip_id = params[:trip_id]
            vote.vote_type = params[:vote_type]
            vote.user_id = current_user.id
            vote.save
        # end

        render json: sum_by_place_and_vote(params[:place_id], params[:vote_type])
    end

    def update
        # change vote from up to down
        vote = Vote.find_by(id: params[:id])
        if vote.vote_type == 'upvote'
            vote.vote_type = 'downvote'
        else
            vote.vote_type = 'upvote'
        end
        vote.save
    end

    def delete
        # delete the vote
        Vote.delete_by(id: params[:id])
    end
end
