class SessionController < ApplicationController

  def create
    binding.pry
    # I want to find the user with the submitted email address
    # I want to compare the submitted password with the user's
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @message = "This email/password combo doesn't exist."
      redirect_to '/'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
