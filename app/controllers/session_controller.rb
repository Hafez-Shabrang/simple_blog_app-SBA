class SessionController < ApplicationController

  def new

  end

  def create
    if params[:session][:email] == ''
      empty = true
    end
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      if user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:success] = "You have been logged in successfully"
        redirect_to users_path
      else
        flash[:error] = "Your email or password is incorrect"
        render :new, status: :unprocessable_entity
      end
    elsif user == nil and empty == true
      flash[:error] = "Login form can't be empty"
      render :new, status: :unprocessable_entity
    else
      flash[:error] = "This user hasn't been signed up"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have been logged out successfully"
    redirect_to root_path
  end

end