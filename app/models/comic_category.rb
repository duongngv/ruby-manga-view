class ComicCategory < ApplicationRecord
  belongs_to :comic
  belongs_to :category
end
