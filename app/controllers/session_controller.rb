class SessionController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user and user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have been logged in successfully"
      redirect_to users_path
    else
      flash[:error] = "Your email or password is incorrect"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have been logged out successfully"
    redirect_to root_path
  end

end