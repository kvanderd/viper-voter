class CategoriesController < ApplicationController


	def show
		@category = Category.find_by_name(params[:search].capitalize)
	end

end