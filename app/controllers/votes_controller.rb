class VotesController < ApplicationController
    def new; end
    def create
        @vote = Vote.new(travel_id: params[:travel_id],
                        user_id: params[:user_id])
        
        if @vote.save
            redirect_to category_path(params[:category_id]), notice: "Successfully voted\n"
        else
            redirect_to category_path(params[:category_id]), alert: "You already voted\n"
        end
    end
end
