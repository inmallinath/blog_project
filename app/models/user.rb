class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  validates :first_name, :last_name, presence: true
  validates :password, length: {minimum: 6}
  validates :email, presence: true,
                    uniqueness: true,
                    format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_secure_password
end
