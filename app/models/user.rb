class User < ApplicationRecord
  has_many :relationships, as: :relationshipable
  has_many :comments, dependent: :destroy
end
