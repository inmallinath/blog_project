class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_secure_password

  has_many :favorites, dependent: :destroy
  has_many :favored_posts, through: :favorites, source: :post

  before_create { generate_token(:auth_token) }

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
                    format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i unless :from_oauth?
  # TWITTER INTEGRATION
  serialize :twitter_data, Hash

  def from_oauth?
    uid.present? && provider.present?
    # auth["provider"].present? #,"uid")).first
  end

  def self.create_from_twitter(twitter_data)
    name = twitter_data["info"]["name"].split(" ")
    User.create(provider: "twitter", uid: twitter_data["uid"], first_name: name[0], last_name: name[1] || ".", password: SecureRandom.hex, email: twitter_data["email"] || "noemail@user.com",
    twitter_token: twitter_data["credentials"]["token"],
    twitter_secret: twitter_data["credentials"]["secret"],
    twitter_raw_data: twitter_data)
  end

  def self.find_twitter_user(omniauth_data)
    where(provider: "twitter", uid: omniauth_data["uid"]).first
  end

  def signed_in_with_twitter?
    provider.present? && uid.present? && provider == "twitter"
  end
  # END OF TWITTER INTEGRATION



  def full_name
    "#{first_name} #{last_name}".titleize
  end

  def send_password_email
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver_now
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def generate_api_key
    self.api_key = SecureRandom.hex(32)
  end
end
