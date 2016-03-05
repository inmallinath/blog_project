class Post < ActiveRecord::Base
  extend FriendlyId
    friendly_id :title, use: [:slugged, :history]

  has_many :comments, dependent: :destroy

  belongs_to :category
  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  validates :title, presence: true,
                    uniqueness: { case_sensitive: false},
                    length: {minimum: 7, maximum: 255}
  validates :body, presence: true
  #                  uniqueness: { case_sensitive: false},

  mount_uploader :image, ImageUploader

  scope :search, lambda {|query|
                    where (["title || body ILIKE ?", "%#{query}%"])}

  def category_name
    category.title if category
  end

  def user_full_name
    user.full_name if user
  end

  def fav_for(user)
    favorites.find_by_user_id user
  end

  # def body_snippet
  #   truncate(self.body, length: 103)
  # end

end
