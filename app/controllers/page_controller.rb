class PageController < ApplicationController
  def index
    # redirect_to register_path if session[:user_id].nil?
    # startup_result = Startup.find_by name: params[:term]
    # investor_result = Investor.find_by name: params[:term]
    #
    # @results = (startup_result + investor_result) || "Nothing was Found"
  end

  def search
    startup_result = Startup.where("name like ?", "%#{params[:term]}%")
    p startup_result
    puts "*" * 20
    investor_result = Investor.where("name like ?", "%#{params[:term]}%")
    p investor_result

    @results = startup_result || investor_result
  end

  def secret
    redirect_to root_path if current_user.admin = nil
  end
end
