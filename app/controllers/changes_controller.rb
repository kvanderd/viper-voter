class ChangesController < ApplicationController

  def new
    @change = Change.new
    @change.categorizations.build
    @categories = Category.all
  end

  def create
		@change = Change.create(change_params)
    params["change"]["category_id"].each do |num|
      n = Category.find_by_name(num)
      c = Categorization.create(change_id: @change.id, category_id: n.id)
    end
		@change.user_id = session[:user_id]
    
   respond_to do |format|
  		if @change.save!
        format.html { redirect_to change_path(@change.id), notice: 'Created An Opinion' }
      end
    end
  end


  def show
    @change = Change.joins(:categories).find(params[:id])
  end


private
  def change_params
    params.require(:change).permit! #(:name, :description, :picture, :user_id, :state_id, :category_id)
  end

  def find_state
     State.where(name: params[:search].capitalize).pop.id
  end


end
