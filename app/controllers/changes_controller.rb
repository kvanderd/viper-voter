class ChangesController < ApplicationController

  def new
    @change = Change.new
    @categories = Category.all
  end

  def create
    puts "this is the create changes" * 9
    ap params
		@change = Change.create(change_params)
		@change.user_id = session[:user_id]
		@change.save!
		redirect_to change_path(@change.id)
  end


  def show
  	@change = Change.find(params[:id])
    @aggregate_votes = @change.aggregate
    # @aggregate_votes = @change.votes.aggregate_votes(@change.id)
  	@vote = Vote.new
  end


private
  def change_params
    params.require(:change).permit(:name, :description, :picture, :user_id, :state_id)
  end

  def find_state
     State.where(name: params[:search].capitalize).pop.id
  end


end
