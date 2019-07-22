class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :set_locale, :load_category

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def load_user
    return if (@user = User.find_by id: params[:id])

    flash[:danger] = t "common.not_found"
    redirect_to root_url
  end

  def verify_admin!
    return if current_user.is_admin?

    flash[:danger] = t "common.admin_require"
    redirect_to root_path
  end

  def require_login
    return if logged_in?

    store_location
    flash[:danger] = t "common.login_require"
    redirect_to login_url
  end

  def load_category
    @categories = Category.sort_by_name
  end
end
