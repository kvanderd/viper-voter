class VotesController < ApplicationController


  def create
  	@vote = Vote.create(vote_params)
  	@aggregate_votes = Vote.aggregate_votes(@vote.change_id)
		  	respond_to do |format|
		    if @vote.save
		      format.js 
		  end
		end
  end


private

  def vote_params
  	params.require(:vote).permit(:upvote, :change_id, :user_id)
  end

end