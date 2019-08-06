class FollowingsController < ApplicationController
  before_action :require_login

  def index
    store_location
    @followes = current_user.following.recently
  end
end
