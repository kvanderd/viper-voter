class Contact < ActiveRecord::Base
	belongs_to :senator
	belongs_to :house
end