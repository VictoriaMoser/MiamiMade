class PageController < ApplicationController

  def index
    @investors = Investor.all.to_json
    @startups = Startup.all.to_json

    # redirect_to register_path if session[:user_id].nil?
    @user = User.new
  end

  def get_filter
    if params[:data]["entity"] == "Investor"

      if params[:data]["vertical"].present? && params[:data]["founded_date"].present? && params[:data]["stage"].present?
        @investor_results = Investor.where(vertical: params[:data]["vertical"], founded_date: params[:data]["founded_date"], stage: params[:data]["stage"])
      end

      if params[:data]["founded_date"].present? && params[:data]["stage"].present?
        @investor_results = Investor.where(founded_date: params[:data]["founded_date"], stage: params[:data]["stage"])
      end

      if params[:data]["stage"].present? && params[:data]["vertical"].present?
        @investor_results = Investor.where(vertical: params[:data]["vertical"], stage: params[:data]["stage"])
      end

      if params[:data]["founded_date"].present? && params[:data]["vertical"].present?
        @investor_results = Investor.where(vertical: params[:data]["vertical"], stage: params[:data]["stage"])
      end

    elsif params[:data]["entity"] == "Startup"
      @startups = Startup.all

    elsif params[:data]["all"]
      @all = Startup.all + Investor.all
    end

  end

  def search
    params[:investorType]
    startup_result = Startup.where("name like ?", "%#{params[:term]}%")
    p startup_result
    puts "*" * 20
    investor_result = Investor.where("name like ?", "%#{params[:term]}%")
    p investor_result
    @results = startup_result || investor_result
  end

  def filter
    @user = User.new
    investors = Investor.all
    startups = Startup.all

    if params[:vertical]
      investors = Investor.where(vertical: params[:vertical]).as_json
      startups = Startup.where(vertical: params[:vertical]).as_json
    end

    if params[:stage]
      investors = Investor.where(stage: params[:stage]).as_json
      startups = Startup.where(stage: params[:stage]).as_json
    end

    render json: { investors: investors.as_json, startups: startups.as_json }
  end

  def vertical_search
    @user = User.new
    @investors = Investor.where(vertical: params[:vertical]).to_json
    @startups = Startup.where(vertical: params[:vertical]).to_json
    # @coords = @results.map do |investor|
    #   {title: investor.name, location: {lat: investor.latitude, lng: investor.longitude}, description: investor.description, type: "investor"}
    # end
    # @coords = @coords.to_json

    render :index
  end

  def secret
    redirect_to root_path if current_user.admin = nil
  end
end
