class Vote < ActiveRecord::Base

	belongs_to :change
	belongs_to :user

	# validates_uniqueness_of :user_id, scope: :change_id

#delete this?
	def self.aggregate_votes(change_id)
   self.where(upvote: true, change_id: change_id).count - self.where(upvote: false, change_id: change_id).count
	end

end