class StaticPagesController < ApplicationController
  before_action :set_comics, only: :home

  def home
    @slide = @latest_update.per Settings.comic.slide_per_page
    @tab_one = @popular.per Settings.comic.popular_per_page
    @tab_two = @updated.per Settings.comic.latest_update_per_page
    @tab_three = @recommended.per Settings.comic.recommended_per_page
    @tab_four = @finished.per Settings.comic.finised_per_page
  end

  def about; end

  def category; end

  private

  def set_comics
    @latest_update = Comic.latest_update.page
    @popular = Comic.popular.page
    @updated = Comic.latest_update.page
    @recommended = Comic.newly_create.page
    @finished = Comic.finished.page
  end
end
