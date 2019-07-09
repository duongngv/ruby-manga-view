class UsersController < ApplicationController
  def show
    return if load_user

    flash[:danger] = t "common.not_found"
    redirect_to root_path
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
  end
end
