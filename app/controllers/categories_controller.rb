class CategoriesController < ApplicationController


	def show
		@category = Category.find(params[:id])
		@changes = @category.changes.sort_by { |c| c.aggregate }.last(9).reverse
	end



private

  def categories_params
  	params.require(:category).permit!
  end

end
