class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.ip_address = request.ip
    # @user.password = params[:password]
    # @user.password_confirmation = params[:password_confirmation]
    if @user.save
      redirect_to user_url(@user)
    else
      flash[:error] = "Something awful has happened!"
      redirect_to new_user_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
