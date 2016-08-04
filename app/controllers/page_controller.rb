class PageController < ApplicationController
  def index
    @investors = Investor.all.to_json
    @startups = Startup.all.to_json
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

  def vertical_search
    @results = Investor.where(vertical: params[:vertical])
    @coords = @results.map do |investor|
      {title: investor.name, location: {lat: investor.latitude, lng: investor.longitude}, description: investor.description, type: "investor"}
    end
    @coords = @coords.to_json

    render :index
  end

  # {title: 'Tim Shop', location: {lat: 25.7617, lng: -80.1918}, description: 'Antique shop ', type:'startup'}

  def secret
    redirect_to root_path if current_user.admin = nil
  end
end
