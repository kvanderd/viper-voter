class Party < ActiveRecord::Base
	belongs_to :house
	belongs_to :senate
end