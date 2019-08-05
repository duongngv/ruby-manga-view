class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :chapter

  validates :content, presence: true,
                      length: {maximum: Settings.comment.content.max_length}

  scope :order_comments, ->{order created_at: :desc}
end
