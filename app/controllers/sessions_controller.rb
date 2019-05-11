class SessionsController < ApplicationController
  def home
  end

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && user.authenticate(params[:session][:password])
      sign_in(user)
    end
    redirect_to root_path
  end

  def destroy
    @user = current_user
    sign_out(@user) if @user
    redirect_to new_session_path
  end

end
