class SessionsController < ApplicationController
  def home
  end

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      sign_in(@user)
      flash[:success] = "Welcome #{@user.name}!"
      redirect_to root_path
    end

  end

  def destroy
    @user = current_user
    sign_out(@user) if @user
    flash[:success] = "You signed out"
    redirect_to root_path
  end

end
