class AdminController < ApplicationController
  before_action :require_login, :verify_admin!

  def index; end
end
