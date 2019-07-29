class CategoriesController < ApplicationController
  before_action :load_category, :show_categories, only: %i(index show)

  def index; end

  def show
    @comics = Comic.by_category(params[:id]).page(params[:page])
                   .per Settings.category.per_page
  end

  private

  def load_category
    return if (@category = Category.find_by id: params[:id])

    flash[:danger] = t "common.not_found"
    redirect_to root_url
  end

  def show_categories
    @categories = Category.sort_by_name
  end
end
