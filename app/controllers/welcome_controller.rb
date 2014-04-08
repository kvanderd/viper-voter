class WelcomeController < ApplicationController


	def index
		@changes = Change.all
		@changes = @changes.sort_by { |c| c.aggregate }.last(9).reverse
		@category = Category.new
	end

	def about
	end


end