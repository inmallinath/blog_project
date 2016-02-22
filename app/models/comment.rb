class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates :body, presence: true,
                  uniqueness: {case_sensitive: false}

  def user_full_name
    user.full_name if user
  end
end
