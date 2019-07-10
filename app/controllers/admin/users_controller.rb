class Admin::UsersController < AdminController
  before_action :load_user, only: :destroy

  def index
    @users = User.name_alphabet.page(params[:page]).per Settings.user.per_page
  end

  def destroy
    if @user.destroy
      flash[:success] = t ".destroy_success"
    else
      flash[:danger] = t ".destroy_fail"
    end
    redirect_to admin_users_path
  end
end
