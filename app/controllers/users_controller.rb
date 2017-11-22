class UsersController < ApplicationController

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome To Anything Blog"
      redirect_to root_path
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end


  private
 #strong params
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
