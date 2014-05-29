module VotesHelper

	#if current_user has voted on this issue
  def vote_users
  	if current_user
  		return "yes_vote"
  	else
  		return "not_vote"
  	end
  end
end
