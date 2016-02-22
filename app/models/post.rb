class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :category
  belongs_to :user

  validates :title, presence: true,
                    uniqueness: { case_sensitive: false},
                    length: {minimum: 7, maximum: 255}
  validates :body, presence: true
  #                  uniqueness: { case_sensitive: false},
  scope :search, lambda {|query|
                    where (["title || body ILIKE ?", "%#{query}%"])}

  def category_name
    category.title if category
  end

  def user_full_name
    user.full_name if user
  end

end
