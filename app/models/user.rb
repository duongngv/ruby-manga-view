class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :relationships, as: :relationshipable
  has_many :comments, dependent: :destroy

  mount_uploader :avatar_user, AvatarUploader
  validates :name, presence: true,
                   length: {maximum: Settings.user.name.max_length}
  validates :email, presence: true,
                    length: {maximum: Settings.user.email.max_length},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
                       length: {minimum: Settings.user.password.min_length},
                       allow_nil: true
  has_secure_password

  before_create :downcase_fields

  scope :name_alphabet, ->{order(:name)}

  def current_user? user
    user == self
  end

  private

  def downcase_fields
    email.downcase!
  end
end
