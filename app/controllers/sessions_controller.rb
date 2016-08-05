class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    # debugger;
    if @user && @user.authenticate(params[:password])
      logger.debug("*****************")
      if @user.email_confirmation
        redirect_to @user
      else
        logger.debug("*****************")
        flash.now[:error] = 'Please check your email to activate your account'
        render 'new'
      end
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
