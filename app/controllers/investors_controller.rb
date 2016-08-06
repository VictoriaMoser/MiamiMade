class InvestorsController < ApplicationController
  before_action :set_investor, only: [:show, :edit, :update, :destroy]

  # GET /investors
  def index
    if session[:user_id]
    @investors = Investor.where(approval: true)
    @user = User.find(session[:user_id])
    else
    redirect_to root_path
    end
  end

  # GET /investors/1
  def show
  end

  # GET /investors/new
  def new
    @investor = Investor.new
  end

  # GET /investors/1/edit
  def edit
  end

  # POST /investors
  def create
    @investor = Investor.new(investor_params)

    respond_to do |format|
      if @investor.save
        format.html { redirect_to @investor, notice: 'Investor was successfully created.' }
        format.json { render :show, status: :created, location: @investor }
      else
        format.html { render :new }
        format.json { render json: @investor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investors/1
  def update
    respond_to do |format|
      if @investor.update(investor_params)
        format.html { redirect_to @investor, notice: 'Investor was successfully updated.' }
        format.json { render :show, status: :ok, location: @investor }
      else
        format.html { render :edit }
        format.json { render json: @investor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investors/1
  def destroy
    @investor.destroy
    respond_to do |format|
      format.html { redirect_to investors_url, notice: 'Investor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approve
    @investor = Investor.find(params[:id])
    @investor.approve
    if @investor.save
      redirect_to admin_panel_path
    else
      # Go back to admin_panel and give error
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investor
      @investor = Investor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investor_params
      params.require(:investor).permit(:name, :email, :website, :address, :description, :founded_date, :approval)
    end

    def approval_params
      params.permit(:approval)
    end
end
