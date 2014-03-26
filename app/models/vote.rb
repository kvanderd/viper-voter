class Vote < ActiveRecord::Base

has_many :changes
has_many :users, through: :change

#delete this?
	def self.aggregate_votes(change_id)
   self.where(upvote: true, change_id: change_id).count - self.where(upvote: false, change_id: change_id).count
	end

end