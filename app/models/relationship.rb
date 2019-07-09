class Relationship < ApplicationRecord
  belongs_to :relationshipable, polymorphic: true
end
