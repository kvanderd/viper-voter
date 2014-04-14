class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		@user.state_id = State.find_by_name(params[:search])
		if @user.save!
			login(@user)
			flash[:notice] = "Success"
			redirect_to :root
		else 
			flash[:notice] = "An error occurred, please try again."
			render :new
		end

	end

	 private

  def user_params
    params.require(:user).permit(:username, :password_digest, :password, :password_confirmation, :id, :state_id)
  end

end