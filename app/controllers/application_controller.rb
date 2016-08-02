class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
  	# session[:user_id] = nil (to reset things in browser without deleting cookies)
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def logged_in?
    not current_user.nil?
  end

  helper_method :logged_in?

  def authorize
    redirect_to '/login' unless current_user
  end
end
