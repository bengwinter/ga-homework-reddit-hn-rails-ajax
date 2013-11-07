class UsersController < ApplicationController

  def new
    @user = User.new
  end

  # process the signup form
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Blake successfully created your account while drinking wine in bed" 
      cookies.permanent[:auth_token] = @user.auth_token
      redirect_to root_url
    else
      redirect_to root_url, notice: "Blake spilled the wine. Please try again!"
    end
  end

  def destroy
    user_id = current_user.id
    user = User.find(user_id)
    session[:user_id] = nil
    user.destroy
    redirect_to root_url, notice: 'Blake ended your time here.'
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password)
  end

end