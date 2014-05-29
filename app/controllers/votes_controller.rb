class VotesController < ApplicationController


  def create
    session[:change_ids] ||= []
    if session[:change_ids].include?(params[:vote][:change_id]) && session[:change_ids].length < 10
       flash.now[:notice] = "You already voted"
    else
      session[:change_ids] << params[:vote][:change_id]
    	@vote = Vote.create(vote_params)
      @vote.save!
      @aggregate_votes = Vote.aggregate_votes(params[:vote][:change_id])
      @change_id = params[:vote][:change_id]
    end

	  	respond_to do |format|
        if @vote
  	      format.js 
          format.html { redirect_to(change_path(params[:vote][:change_id])) }
        else
          redirect_to :back, alert: "Unable to vote, perhaps you already did."
        end
  		end

  end


private

  def vote_params
  	params.require(:vote).permit(:upvote, :change_id, :user_id)
  end

end