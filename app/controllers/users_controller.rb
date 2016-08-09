class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      flash[:success] = "Please confirm your email address to continue"
      UserMailer.admin_confirmation(User.find(11)).deliver
      redirect_to root_path

    else
      flash[:error] = "Ooooppss, something went wrong!"
      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @current_user.admin
      @user.destroy
      respond_to do |format|
        format.html { redirect_to admin_panel_path, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_path
    end
  end

  def admin_panel
    # unless logged_in? and current_user.admin
    if not logged_in? or not current_user.admin
      redirect_to login_path
      return
    end
    @investors = Investor.where(approval: false)
    @startups = Startup.where(approval: false)
    @users = User.where(approval: false)
  end

    def approve
      @user = User.find(params[:id])
      @user.approved_user
      if @user.save!
        redirect_to admin_panel_path
      else
        # Go back to admin_panel and give error
      end
    end

  def confirm_email
    user = User.find_by_token_confirmation(params[:id])
    if user
      user.email_activate
      flash[:success] = "Welcome to Miami Made! Your email has been confirmed.
      Please sign in to continue."
      redirect_to login_path
    else
      flash[:error] = "Sorry. Username does not exist"
      redirect_to root_path
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
