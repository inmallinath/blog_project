class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :creation_date, :created_by, :category, :favorite_count

  has_many :comments

  def title
    object.title.titleize
  end

  def creation_date
    object.created_at.strftime("%Y-%b-%d")
  end

  def created_by
    object.user.full_name
  end

  def category
    object.category.title
  end

  def favorite_count
    object.favorites.count
  end
end
