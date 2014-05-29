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


  def vote


   value = params[:value]
    @v = Vote.find_or_create_by(change_id: params[:id], user_id: current_user.id)
    @v.value = value
    @v.save!
 
    # vote = current_user.votes.new(value: params[:value], change_id: params[:id])
    respond_to do |format|
      @v = @v.value.to_i
      # if v.value == value.to_i
      #   ap "love" * 90
      #   puts "you voted the same way"
      # else
      #   v.value = value
      #   redirect_to :back, notice: "Unable to vote, perhaps you already did."

        # v.save!
        #send some data back to the dom that updates vote count by one, and highlights the up area.
        # redirect_to :back, notice: "Thank you for voting."
        format.js
      # else
      #   redirect_to :back, notice: "Unable to vote, perhaps you already did."
      # end
    end
  end


private
  def change_params
    params.require(:change).permit! #(:name, :description, :picture, :user_id, :state_id, :category_id)
  end

  def find_state
     State.where(name: params[:search].capitalize).pop.id
  end


end
