class User < ActiveRecord::Base
  has_many :changes
  has_many :votes #, through: :changes
  belongs_to :state
	validates :username, presence: true
	validates :username, uniqueness: true
	has_secure_password

end