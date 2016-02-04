class Post < ActiveRecord::Base
  validates :title, presence: true,
                    uniqueness: { case_sensitive: false},
                    length: {minimum: 1, maximum: 255}
  # validates :body, presence: true,
  #                  uniqueness: { case_sensitive: false},

end
