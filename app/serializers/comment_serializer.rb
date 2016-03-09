class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment, :posted_on, :commented_by

  def comment
    object.body
  end

  def posted_on
    object.created_at.strftime("%Y-%b-%d")
  end

  def commented_by
    object.user.full_name
  end
end
