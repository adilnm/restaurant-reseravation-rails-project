class ApplicationController < ActionController::Base
  def current_user
    User.find(session[:user_id])
  end

  def require_login
    if !logged_in?
      redirect_to login_path
    end
  end

  def logged_in?
    session[:user_id]
  end

  helper_method :current_user
end
