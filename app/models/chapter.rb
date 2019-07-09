class Chapter < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :pictures, dependent: :destroy
  belongs_to :comic

  validates :name, presence: true,
                   length: {maximum: Settings.chapter.name.max_length}
end
