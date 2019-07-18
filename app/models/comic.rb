class Comic < ApplicationRecord
  COMIC_ATTR = %i(name author description thumb publish_date
                  views status category_id).freeze

  has_many :relationships, dependent: :destroy
  has_many :likes, through: :relationships, source: :relationshipable,
                   source_type: :Like
  has_many :comic_followers, through: :relationships,
                             source: :relationshipable,
                             source_type: :comic_followers

  has_many :chapters, dependent: :destroy
  belongs_to :category

  validates :name, presence: true,
                   length: {maximum: Settings.comic.name.max_length}
  validates :author, presence: true,
                     length: {maximum: Settings.comic.author.max_length}
  validates :description, presence: true,
                  length: {maximum: Settings.comic.description.max_length}
  validate :thumb_size

  mount_uploader :thumb, ThumbUploader

  scope :name_alphabet, ->{order :name}

  enum status: {newly_created: 0, newly_update: 1, hot: 2, finished: 3}

  private

  def thumb_size
    return unless thumb.size > Settings.comic.thumb_size.megabytes

    errors.add :thumb, t("mix.valid_size")
  end
end
