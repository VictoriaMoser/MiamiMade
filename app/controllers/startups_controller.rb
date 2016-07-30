class StartupsController < ApplicationController
  def index
    @startups = Startup.all
  end

  def new
    @new = Startup.new
  end

  def create
    @startup = Startup.new(startup_params)
    @startup.aprove
      session[:startup_id] = @startup.id
      # redirect_to root_path
  end

  def edit
  end

  def destroy
  end
end
