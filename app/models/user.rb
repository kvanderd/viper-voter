class User < ActiveRecord::Base
	has_many :changes
	has_many :votes #, through: :changes
	belongs_to :state
	validates :username, presence: true
	validates :username, uniqueness: true
	validates_confirmation_of :password
	has_secure_password





  def vote_for(change_id)
  	vote = self.votes.where(change_id: change_id).first || self.votes.build(change_id: change_id)
  end
end