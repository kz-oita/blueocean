class Relationship < ApplicationRecord
  belongs_to :following, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  validates :following_id, :followed_id, presence: true
end
