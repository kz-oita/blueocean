class Post < ApplicationRecord
  validates :title, :text, presence: true
  belongs_to :user
  has_many :comments
  acts_as_taggable

  def self.search(search)
    return Post.all unless search
    Post.where('text LIKE(?)', "%#{search}%")
  end
end
