class Chapter < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :pictures, dependent: :destroy
  belongs_to :comic
end
