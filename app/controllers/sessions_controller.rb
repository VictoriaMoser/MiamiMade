class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
    # debugger;
    if @user && @user.authenticate(params[:password])
      logger.debug("*****************")
      if @user.email_confirmation && @user.approval
        session[:user_id] = @user.id
        redirect_to @user
      else
        if !@user.email_confirmation
          flash.now[:error] = 'Please check your email to activate your account'
        else
          flash.now[:error] = 'I apologize but you do not have access to this website'
        end
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
