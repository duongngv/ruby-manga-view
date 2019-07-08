class Category < ApplicationRecord
  has_many :comic_categories, dependent: :destroy
end
