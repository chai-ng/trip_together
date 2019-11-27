class Api::VotesController < ApplicationController
    def index
    # List all resources in the database
    # GET /resource
        render json: Vote.where(trip_id: params[:trip_id])
    end

    def create
        vote = Vote.new
        vote.place_id = params[:place_id]
        vote.trip_id = params[:trip_id]
        vote.vote_type = params[:vote_type]
        vote.user_id = current_user.id
        vote.save
    end

    def show
    # Show specific trip from /trips/:id
    # GET /resource/:id
        render json: Vote.find_by(id: params[:vote_id])
    end

    def edit
    # Show HTML form to edit a specific resource
    # GET /resource/:id/edit
    end

    def update
    # change upvote to downvote
        vote = Vote.where(id: params[:vote_id])
        if vote.vote_type == 'upvote'
            vote.vote_type = 'downvote'
        else
            vote.vote_type = 'downvote'
        end
    end

    def delete
    # Destory a specific resource in the database from /trips/:id
    # DELETE /resource/:id
        Vote.delete_by(id: params[:vote_id])
    end
end
