class CommentsMailer < ApplicationMailer
  def notify_post_owner(comment)
    @comment = comment
    @post = comment.post
    @owner = @post.user
    mail(to: @owner.email, subject: "Your post has a new comment!")
  end
end
