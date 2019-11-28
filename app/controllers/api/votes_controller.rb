class Api::VotesController < ApplicationController
    def index
        # return me all the votes associated with a trip_id
        render json: Vote.where(trip_id: params[:trip_id])
    end

    def sum_by_place
        # sum by place_id and vote_type
        result = Vote.group(:place_id, :vote_type).count
        render json: result
    end

    def create
        vote = Vote.new
        vote.place_id = params[:place_id]
        vote.trip_id = params[:trip_id]
        vote.vote_type = params[:vote_type]
        vote.user_id = current_user.id
        vote.save
        render json: vote.id
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
