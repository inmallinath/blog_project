class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_secure_password

  has_many :favorites, dependent: :destroy
  has_many :favored_posts, through: :favorites, source: :post

# ADDED the BELOW CODE FOR AUTH TOKEN - REMEMBER ME FUNCTIONALITY
  # before_create do
  #   begin
  #     self[:auth_token] = SecureRandom.urlsafe_base64
  #   end while User.exists?(:auth_token => self[:auth_token])
  # end
# END OF CODE
  # validates :password_digest, presence: true
  validates :first_name, :last_name, presence: true
  validates :password, length: {minimum: 6}, on: :create
  validates :email, presence: true,
                    uniqueness: true,
                    format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def full_name
    "#{first_name} #{last_name}".titleize
  end

end
