class PageController < ApplicationController

  def index

    # @investors = Investor.all.to_json
    # @startups = Startup.all.to_json
    # gon.investors = Investor.all.grab_location

    gon.investorsLoc = Investor.grab_location
    gon.startupsAll = Startup.all
    gon.investorsAll = Investor.all
    # gon.entities = Startup.all + Investor.all

    # redirect_to register_path if session[:user_id].nil?
    @user = User.new
  end

  def get_filter

    if params[:data]["entity"][0].downcase == "investor"

      if params[:data]["vertical"].present? && params[:data]["founded_date"].present? && params[:data]["stage"].present?
        @results = Investor.where(vertical: params[:data]["vertical"], founded_date: params[:data]["founded_date"], stage: params[:data]["stage"])
      end

      if params[:data]["founded_date"].present? && params[:data]["stage"].present?
        @results = Investor.where(founded_date: params[:data]["founded_date"], stage: params[:data]["stage"])
      end

      if params[:data]["stage"].present? && params[:data]["vertical"].present?
        @results = Investor.where(vertical: params[:data]["vertical"], stage: params[:data]["stage"])
      end

      if params[:data]["founded_date"].present? && params[:data]["vertical"].present?
        @results = Investor.where(vertical: params[:data]["vertical"], stage: params[:data]["stage"])
      end

      if params[:data]["founded_date"].present?
        @results = Investor.where(founded_date: params[:data]["founded_date"])
      end

      if params[:data]["stage"].present?
        @results = Investor.where(stage: params[:data]["stage"])
      end

      if params[:data]["vertical"].present?
        # logger.debug("*******#{Investor.where(vertical: params[:data]["vertical"])}******")
        @results = Investor.where(vertical: params[:data]["vertical"])
      end

      if params[:data]["vertical"].nil? && params[:data]["founded_date"].nil? && params[:data]["stage"].nil?
        @results = Investor.all
      end

    elsif params[:data]["entity"][0].downcase == "startup"

      if params[:data]["vertical"].present? && params[:data]["founded_date"].present? && params[:data]["stage"].present?
        @results = Startup.where(vertical: params[:data]["vertical"], founded_date: params[:data]["founded_date"], stage: params[:data]["stage"])
      end

      if params[:data]["founded_date"].present? && params[:data]["stage"].present?
        @results = Startup.where(founded_date: params[:data]["founded_date"], stage: params[:data]["stage"])
      end

      if params[:data]["stage"].present? && params[:data]["vertical"].present?
        @results = Startup.where(vertical: params[:data]["vertical"], stage: params[:data]["stage"])
      end

      if params[:data]["founded_date"].present? && params[:data]["vertical"].present?
        @results = Startup.where(vertical: params[:data]["vertical"], stage: params[:data]["stage"])
      end

      if params[:data]["founded_date"].present?
        @results = Startup.where(founded_date: params[:data]["founded_date"])
      end

      if params[:data]["stage"].present?
        @results = Startup.where(stage: params[:data]["stage"])
      end

      if params[:data]["vertical"].present?
        @results = Startup.where(vertical: params[:data]["vertical"])
      end

      if params[:data]["vertical"].nil? && params[:data]["founded_date"].nil? && params[:data]["stage"].nil?
        @results = Startup.all
      end

    elsif params[:data]["all"][0].downcase == "all"

      if params[:data]["vertical"].present? && params[:data]["founded_date"].present? && params[:data]["stage"].present?
        startup_results = Startup.where(vertical: params[:data]["vertical"], founded_date: params[:data]["founded_date"], stage: params[:data]["stage"])

        investor_results = Investor.where(vertical: params[:data]["vertical"], founded_date: params[:data]["founded_date"], stage: params[:data]["stage"])
        @results = startup_results + investor_results
      end

      if params[:data]["founded_date"].present? && params[:data]["stage"].present?
        startup_results = Startup.where(founded_date: params[:data]["founded_date"], stage: params[:data]["stage"])
        investor_results = Investor.where(founded_date: params[:data]["founded_date"], stage: params[:data]["stage"])
        @results = startup_results + investor_results
      end

      if params[:data]["stage"].present? && params[:data]["vertical"].present?
        startup_results = Startup.where(vertical: params[:data]["vertical"], stage: params[:data]["stage"])
        investor_results = Investor.where(vertical: params[:data]["vertical"], stage: params[:data]["stage"])
        @results = startup_results + investor_results
      end

      if params[:data]["founded_date"].present? && params[:data]["vertical"].present?
        startup_results = Startup.where(vertical: params[:data]["vertical"], stage: params[:data]["stage"])
        investor_results = Investor.where(vertical: params[:data]["vertical"], stage: params[:data]["stage"])
        @results = startup_results + investor_results
      end

      if params[:data]["founded_date"].present?
        startup_results = Startup.where(founded_date: params[:data]["founded_date"])
        investor_results = Investor.where(founded_date: params[:data]["founded_date"])
        @results = startup_results + investor_results
      end

      if params[:data]["stage"].present?
        startup_results = Startup.where(stage: params[:data]["stage"])
        investor_results = Investor.where(stage: params[:data]["stage"])
        @results = startup_results + investor_results
      end

      if params[:data]["vertical"].present?
        startup_results = Startup.where(vertical: params[:data]["vertical"])
        investor_results = Investor.where(vertical: params[:data]["vertical"])
        @results = startup_results + investor_results
      end

      if params[:data]["vertical"].nil? && params[:data]["founded_date"].nil? && params[:data]["stage"].nil?
        @results = Startup.all + Investor.all
      end

    end
    render json: @results
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

  # def filter
  #   @user = User.new
  #   investors = Investor.all
  #   startups = Startup.all
  #
  #   if params[:vertical]
  #     investors = Investor.where(vertical: params[:vertical]).as_json
  #     startups = Startup.where(vertical: params[:vertical]).as_json
  #   end
  #
  #   if params[:stage]
  #     investors = Investor.where(stage: params[:stage]).as_json
  #     startups = Startup.where(stage: params[:stage]).as_json
  #   end
  #
  #   render json: { investors: investors.as_json, startups: startups.as_json }
  # end

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
