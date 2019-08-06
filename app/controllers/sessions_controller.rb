class SessionsController < ApplicationController
  before_action :load_user, only: :create

  def new
    return unless logged_in?

    flash[:warning] = t ".login_alright"
    redirect_to root_url
  end

  def create
    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = t ".welcome"
      log_in @user
      if current_user.is_admin?
        redirect_back_or admin_root_path
      else
        redirect_back_or @user
      end
    else
      flash.now[:danger] = t ".error"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def load_user
    @user = User.find_by email: params[:session][:email].downcase
  end
end
