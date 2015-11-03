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
      flash[:notice] = "Invalid fields. Try again."
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

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in"
      redirect_to login_url
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
  end

end
