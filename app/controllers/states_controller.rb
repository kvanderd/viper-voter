class StatesController < ApplicationController

	def show
		@state = State.find_by_name(params[:search].capitalize)
	end

private

  def state_params
  	params.require(:state).permit(:name)
  end

	
end