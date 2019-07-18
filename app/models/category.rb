class Category < ApplicationRecord
  has_many :comics, dependent: :destroy

  validates :name, presence: true,
                   length: {maximum: Settings.category.name.max_length}

  scope :sort_by_name, ->{order :name}
end
