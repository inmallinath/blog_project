class CommentsController < ApplicationController
  # def new
  #   @comment = Comment.new
  # end

  def create
    @post = Post.find params[:post_id]
    comment_params = params.require(:comment).permit([:body])
    @comment = Comment.new comment_params
    @comment.post = @post
    if @comment.save!
      redirect_to post_path(@post), notice: "Comment Created"
    else
      render "/posts/show"
    end
  end

  # def index
  #   @comments = Comment.all
  # end
  #
  #
  # def show
  #   @comment = Comment.find params[:id]
  # end
  #
  # def edit
  #   @comment = Comment.find params[:id]
  # end
  #
  # def update
  #   @comment = Comment.find params[:id]
  #   comment_params = params.require(:comment).permit([:body])
  #   if @comment.update comment_params
  #     redirect_to comment_path(@comment)
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy

    redirect_to post_path(params[:post_id]), notice: "Comment Deleted!"
  end
end
