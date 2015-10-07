class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to '/'
    else
      flash[:notice] = "Invalid fields. Try again. "
      redirect_to '/signup'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
