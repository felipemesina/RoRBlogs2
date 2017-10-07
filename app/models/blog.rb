class Blog < ActiveRecord::Base
  has_many :owners
  has_many :posts
  has_many :users, through: :owners
  has_many :user_posts, through: :posts

  validates :name, :description, presence: true
end
