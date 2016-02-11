# REQUIREMENT * Post: title(required & unique), body
class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  # attr_accessor :title, :body

  validates :title, presence: true,
                    uniqueness: { case_sensitive: false},
                    length: {minimum: 1, maximum: 255}
  # validates :body, presence: true,
  #                  uniqueness: { case_sensitive: false},
  scope :search, lambda {|query|
                    where (["title || body ILIKE ?", "%#{query}%"])}

  def self.next(number=5)
    order("title").offset(number).limit(number)
  end

  # scope :lessthan10?, lambda { count < 10 }
  def self.lessthan10?
    count < 10
  end

end
