module FollowingsHelper
  def total_follow comic
    @total = comic.following.size
  end

  def load_comic_following comic
    current_user.relationships.find_by(comic_id: comic.id)
  end

  def init_follow
    current_user.relationships.build
  end
end
