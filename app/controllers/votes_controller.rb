class VotesController < ApplicationController


  def create
    session[:change_ids] ||= []
    if session[:change_ids].include?(params[:vote][:change_id]) && session[change_id].lenght < 10
       flash.now[:notice] = "You already voted"
    else
      session[:change_ids] << params[:vote][:change_id]
    	@vote = Vote.create(vote_params)
      @vote.save!
    end
      @aggregate_votes = Vote.aggregate_votes(params[:vote][:change_id])
      @change_id = params[:vote][:change_id]

	  	respond_to do |format|
	      format.js 
        format.html { redirect_to(change_path(params[:vote][:change_id])) }
  		end

  end


private

  def vote_params
  	params.require(:vote).permit(:upvote, :change_id, :user_id)
  end

end