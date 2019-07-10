class Relationship < ApplicationRecord
  belongs_to :relationshipable, polymorphic: true
  belongs_to :user
  belongs_to :comic
end
