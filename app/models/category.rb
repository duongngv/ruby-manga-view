class Category < ApplicationRecord
  has_many :comic_categories, dependent: :destroy

  validates :name, presence: true,
                   length: {maximum: Settings.category.name.max_length}
end
