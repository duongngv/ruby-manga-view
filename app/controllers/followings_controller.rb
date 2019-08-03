class FollowingsController < ApplicationController
  before_action :require_login

  def index
    @followes = current_user.following.recently
  end
end
