class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :relationships
  has_many :likes, through: :relationships, source: :relationshipable,
                  source_type: :Like
  has_many :following, through: :relationships,
                            source: :relationshipable,
                            source_type: :ComicFollow
  has_many :comments, dependent: :destroy

  mount_uploader :avatar_user, AvatarUploader
  validates :name, presence: true,
                   length: {maximum: Settings.user.name.max_length}
  validates :email, presence: true,
                    length: {maximum: Settings.user.email.max_length},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
                       length: {minimum: Settings.user.password.min_length},
                       allow_nil: true
  has_secure_password

  before_save :downcase_fields

  scope :name_alphabet, ->{order :name}

  def current_user? user
    user == self
  end

  def follow comic
    Relationship.create(
      comic_id: comic.id,
      user_id: id,
      relationshipable: ComicFollow.create
    )
  end

  def unfollow comic
    return unless relationship = Relationship.find_by(
      user_id: id,
      comic_id: comic.id,
      relationshipable_type: "ComicFollow"
    )

    return unless comic_follow = ComicFollow.find_by(
      id: relationship.relationshipable_id
    )

    following.find_by(id: comic_follow.id).destroy
  end

  def following? comic
    following.each do |following|
      return true if following.comic.eql? comic
    end
    false
  end

  def like comic
    Relationship.create(
      comic_id: comic.id,
      user_id: id,
      relationshipable: Like.create
    )
  end

  def unlike comic
    return unless relationship = Relationship.find_by(
      user_id: id,
      comic_id: comic.id,
      relationshipable_type: "Like"
    )

    return unless comic_like = Like.find_by(
      id: relationship.relationshipable_id
    )

    likes.find_by(id: comic_like.id).destroy
  end

  def liked? comic
    likes.each do |like|
      return true if like.comic.eql? comic
    end
    false
  end

  private

  def downcase_fields
    email.downcase!
  end
end
