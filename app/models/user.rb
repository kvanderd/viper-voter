class User < ActiveRecord::Base
	has_many :changes
	has_many :votes #, through: :changes
	belongs_to :state
	validates :username, presence: true
	validates :username, uniqueness: true
	validates_confirmation_of :password
	has_secure_password


	def can_vote_for?(change)
	  votes.build(value: 1, change: change).valid?
	end

end