class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  has_many :active_follows, class_name: 'Relationship',
                            foreign_key: 'following_id',
                            dependent: :destroy
  has_many :followings, through: :active_follows, source: :followed
  has_many :passive_follows, class_name: 'Relationship',
                            foreign_key: 'followed_id',
                            dependent: :destroy
  has_many :followers, through: :passive_follows, source: :following



  mount_uploader :image, ImageUploader

  validates :name, presence: true

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

  def follow!(other_user)  
    active_follows.create!(followed_id: other_user.id)  
  end  
  
  def unfollow!(other_user)  
    active_follows.find_by(followed_id: other_user.id).destroy!  
  end  
  
  def following?(other_user)  
    followings.include?(other_user)  
  end  
end
