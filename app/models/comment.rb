class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :chapter

  validates :content, presence: true,
                      length: {maximum: Settings.comment.content.max_length}
end
