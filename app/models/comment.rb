class Comment < ActiveRecord::Base
  validates :body, presence: true,
                  uniqueness: {case_sensitive: false},
                  length: {minimum: 1, maximum: 255}
end
