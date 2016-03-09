class Api::V1::PostsController < Api::BaseController
  def index
    @posts = Post.joins(:favorites).group("id").order("count(*) DESC")
    render json: @posts
  end

  def show
    @post = Post.find params[:id]
    render json: @post
  end

  def create
    post_params = params.require(:post).permit(["title", "body"])
    post = Post.new post_params
    post.user = current_user
    if post.save
      head :ok
    else
      render json: {errors: post.errors.full_messages}
    end
  end
end
