module FollowingsHelper
  def total_follow comic
    @total = comic.following.size
  end
end
