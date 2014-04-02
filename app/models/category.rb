class Category < ActiveRecord::Base
	has_many :categorizations
	has_many :changes, through: :categorizations

end