class ApplicationController < ActionController::Base
  include Pundit::Authorization
  helper_method :current_user, :logged_in?
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_login
    if !logged_in?
      flash[:error] = "You must be logged in"
      redirect_to login_path
    end
  end

  def admin_associations
    if !current_user.is_admin?
      flash[:error] = "You are not admin"
      redirect_to root_path
    end
  end

end
