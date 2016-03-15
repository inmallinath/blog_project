class CommentsController < ApplicationController
  # except: [:index] added to ensure that the jQuery client gets the required JSON without authentication intervention
  before_action :authenticate_user, except: [:index]

  #Used for rendering JSON to jQuery Client
  def index
    @post = Post.friendly.find params[:post_id]
    render json: @post.comments
  end

  def create
    @post = Post.friendly.find params[:post_id]
    comment_params = params.require(:comment).permit([:body])
    @comment = Comment.new comment_params
    @comment.post = @post
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        CommentsMailer.notify_post_owner(@comment).deliver_now
        format.html{redirect_to post_path(@post), notice: "Comment Created"}
        format.js{render :create_success}
      else
        flash.now[:alert] = "Comment wasn't created!"
        format.html{render "/posts/show"}
        format.js{render :create_failure}
      end
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    respond_to do |format|
      format.html{redirect_to post_path(params[:post_id]), notice: "Comment Deleted!"}
      format.js { render }
    end
  end
end
