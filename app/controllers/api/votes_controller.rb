class Api::VotesController < ApplicationController
    def index
        # return me all the votes associated with a trip_id
        render json: Vote.where(trip_id: params[:trip_id])
    end

    def sum_by_place_and_vote(place_id, vote_type)
        # sum by place_id and vote_type
        Vote.where(place_id: place_id, vote_type: vote_type).count
    end

    def sum_by_place(place_id)
        # sum by place_id and vote_type
        Vote.where(place_id: place_id).group(:vote_type).count
    end

    def by_user
        render json: Vote.where(trip_id: params[:trip_id], user_id: current_user)
    end

    def create
        existing_votes = Vote.where(place_id: params[:place_id], user_id: current_user.id)

        # check if existing vote = if yes, then modify
        if existing_votes.count == 1
            vote = existing_votes.first
            # if same vote_type = delete
            if vote.vote_type == params[:vote_type]
                vote.delete
            else
            # if different vote_type = update
                if vote.vote_type == 'upvote'
                    vote.vote_type = 'downvote'
                else
                    vote.vote_type = 'upvote'
                end
                vote.save
            end
        else
        
        # create new vote
            vote = Vote.new
            vote.place_id = params[:place_id]
            vote.trip_id = params[:trip_id]
            vote.vote_type = params[:vote_type]
            vote.user_id = current_user.id
            vote.save
        end

        render json: sum_by_place(params[:place_id])
    end

    def delete
        # delete the vote
        Vote.delete_by(id: params[:id])
    end
end
