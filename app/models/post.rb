class Post < ApplicationRecord
  validates  :title, :text, presence: true
  belongs_to :user
  has_many   :images
  has_many   :comments, foreign_key: :post_id, dependent: :destroy
  has_many   :likes, foreign_key: :post_id, dependent: :destroy
  has_many   :liked_users, through: :likes, source: :user
  acts_as_taggable

  validates  :title, :text, presence: true
  accepts_nested_attributes_for :images, allow_destroy: true
  
  def self.search(search)
    return Post.all unless search
    Post.where('text LIKE(?)', "%#{search}%")
  end
end
