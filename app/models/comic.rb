class Comic < ApplicationRecord
  COMIC_ATTR = %i(name author description thumb publish_date
                  views status category_id).freeze

  has_many :relationships
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
  scope :newly_create, ->{order created_at: :desc}
  scope :popular, ->{order views: :desc}
  scope :latest_update, ->{order updated_at: :desc}
  scope :finished, ->{where status: Settings.comic.finished}
  scope :by_category, ->(id){joins(:category).merge(where(category_id: id))}

  enum status: {
    newly_created: Settings.comic.created,
    newly_update: Settings.comic.updated,
    hot: Settings.comic.hot,
    finished: Settings.comic.finished
  }

  private

  def thumb_size
    return unless thumb.size > Settings.comic.thumb_size.megabytes

    errors.add :thumb, t("mix.valid_size")
  end
end
