class VotesController < ApplicationController
  def new; end

  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      flash.notice = "Successfully voted\n"
    else
      flash.alert = "You already voted\n"
    end
    redirect_back fallback_location: '/', allow_other_host: false
  end

  def vote_params
    params.permit(:travel_id, :user_id)
  end
end
