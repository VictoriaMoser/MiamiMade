class PageController < ApplicationController
  def index
    redirect_to register_path if session[:user_id].nil?
  end

  def secret
    redirect_to root_path if current_user.admin?
  end
end
