class ComicFollower < ApplicationRecord
  has_one :relationships, as: :relationshipable, dependent: :destroy
  has_one :comic, through: :relationships, source: :comic
  has_one :user, through: :relationships, source: :user
end
