class OfficeTerm < ActiveRecord::Base
	belongs_to :house
	belongs_to :senate
end

