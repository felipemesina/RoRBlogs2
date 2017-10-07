class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_many :posts
  has_many :messages
  has_many :owners
  has_many :blogs, through: :owners
  has_many :blog_posts, through: :posts, source: :blog

  validates_presence_of :first_name, :last_name, :email_address
  validates :email_address, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
