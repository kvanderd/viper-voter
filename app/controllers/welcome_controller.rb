class WelcomeController < ApplicationController


	def index
		@changes = Change.all
		@changes = @changes.sort_by { |c| c.aggregate }.last(9).reverse
		@categories = Category.all
	end

	def about
	end


end