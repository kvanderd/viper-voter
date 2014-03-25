class SessionsController < ApplicationController

  def new
   
  end

  def create
    puts "I am in the create session" * 9
    ap params
    @user = User.find_by_username(params[:user][:username])
    login(@user)
    if @user && @user.authenticate(params[:user][:password])
      flash[:success] = "Welcome, #{@user.username}!"
      redirect_to root_path #action: 'show', id: @user.id
    else
      flash[:notice] = "An error occured, please try again."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end


  def session_params
    params.require(:user).permit(:username, :password_digest, :password, :password_confirmation)
  end

end