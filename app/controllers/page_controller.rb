class PageController < ApplicationController
  def index
    redirect_to register_path if session[:user_id].nil?
  end

  def secret
  end
end
