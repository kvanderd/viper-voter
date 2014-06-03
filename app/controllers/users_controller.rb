class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		ap params
		@user = User.create(user_params)
		# @user.state_id = State.find_by_name(params[:search].capitalize)

		state = State.find_by_name(params[:search].capitalize)
		@user.state_id = state.id if state

		respond_to do |format|
			if @user.save
				login(@user)
				format.html { redirect_to(:root, notice: 'User was successfully created.') }
			else 
				 format.html { render action: "new"}
				 format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end

	end

	 private

  def user_params
    params.require(:user).permit(:username, :password_digest, :password, :password_confirmation, :id, :state_id)
  end

end



