class Comic < ApplicationRecord
  has_many :relationships, as: :follow
  has_many :relationships, as: :like
  has_many :chapters, dependent: :destroy
  has_many :comic_categories, dependent: :destroy
end
