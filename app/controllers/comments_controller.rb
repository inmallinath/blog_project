class CommentsController < ApplicationController
  before_action :authenticate_user

  def create
    @post = Post.find params[:post_id]
    comment_params = params.require(:comment).permit([:body])
    comment = Comment.new comment_params
    comment.post = @post
    comment.user = current_user
    if comment.save
      CommentsMailer.notify_post_owner(comment).deliver_later
      redirect_to post_path(@post), notice: "Comment Created"
    else
      flash.now[:alert] = "Comment wasn't created!"
      render "/posts/show"
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to post_path(params[:post_id]), notice: "Comment Deleted!"
  end
end
