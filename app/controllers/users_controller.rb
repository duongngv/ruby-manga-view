class UsersController < ApplicationController
  before_action :load_user, :current_user, only: %i(show update edit)
  before_action :require_login, :correct_user, only: %i(edit update)

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:success] = t ".success"
      redirect_to login_path
    else
      flash[:danger] = t ".fails"
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "users.edit.update_succ"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :avatar_user
  end

  def correct_user
    @user = User.find_by id: params[:id]
    return if @user.current_user? current_user

    flash[:danger] = t "common.admin_require"
    redirect_to root_url
  end
end
