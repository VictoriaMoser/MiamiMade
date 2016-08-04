class PageController < ApplicationController

  def index
    @user = User.new
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

  def secret
    redirect_to root_path if current_user.admin = nil
  end
end
