class StartupsController < ApplicationController
  before_action :set_startup, only: [:show, :edit, :update, :destroy]

  def index
    if session[:user_id]
    @startups = Startup.where(approval: true)
    @user = User.find(session[:user_id])
  else
    redirect_to root_path
  end
end

  def show
  end

  def new
    @startup = Startup.new
  end

  def edit
  end

  def create
    @startup = Startup.new(startup_params)

    respond_to do |format|
      if @startup.save
        format.html { redirect_to @startup, notice: 'Startup was successfully created.' }
        format.json { render :show, status: :created, location: @startup }
      else
        format.html { render :new }
        format.json { render json: @startup.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @startup.update(startup_params)
        format.html { redirect_to @startup, notice: 'Startup was successfully updated.' }
        format.json { render :show, status: :ok, location: @startup }
      else
        format.html { render :edit }
        format.json { render json: @startup.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @startup.destroy
    respond_to do |format|
      format.html { redirect_to startups_url, notice: 'Startup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approve
    @startup = Startup.find(params[:id])
    @startup.approve
    if @startup.save
      redirect_to admin_panel_path
    else
      # Go back to admin_panel and give error
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_startup
      @startup = Startup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def startup_params
      params.require(:startup).permit(:name, :email, :website, :address, :description, :founded_date, :approval)
    end

    def approval_params
      params.permit(:approval)
    end
end
