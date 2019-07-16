class Picture < ApplicationRecord
  belongs_to :chapter
  mount_uploader :picture, ImagePageUploader
end
