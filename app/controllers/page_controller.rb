class PageController < ApplicationController
  def index
    # redirect_to register_path if session[:user_id].nil?

    # @options = ["All", "Advertising", "Apps", "Biotechnology", "Commerce and Shopping", "Community and Lifestyle", "Consumer Electronics", "Content and Publishing", "Data and Analytics", "Fashion", "Financial Services", "Food and Beverage", "Government and Military", "Hardware", "Healthcare", "Internet Services", "Manufacturing", "Media and Entertainment", "Mobile", "Software"].sort
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
