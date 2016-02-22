class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_secure_password

# ADDED the BELOW CODE FOR AUTH TOKEN - REMEMBER ME FUNCTIONALITY
  # before_create do
  #   begin
  #     self[:auth_token] = SecureRandom.urlsafe_base64
  #   end while User.exists?(:auth_token => self[:auth_token])
  # end
# END OF CODE

  validates :first_name, :last_name, presence: true
  validates :password, length: {minimum: 6}
  validates :email, presence: true,
                    uniqueness: true,
                    format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def full_name
    "#{first_name} #{last_name}".titleize
  end

end
