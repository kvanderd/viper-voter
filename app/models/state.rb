class State < ActiveRecord::Base
	has_many :houses
	has_many :senates
	has_many :changes
	has_many :users
	
end