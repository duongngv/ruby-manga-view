class UsersController < ApplicationController
  before_action :load_user, only: :show

  def show; end
end
