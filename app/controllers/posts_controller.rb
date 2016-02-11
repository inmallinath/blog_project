class PostsController < ApplicationController

  # ADDED TODAY
  def search
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC")
    else
      @posts = Post.order("created_at DESC")
    end
  end
  # END OF CODE

  def new
    @post = Post.new
  end

  def create
    post_params = params.require(:post).permit([:title, :body])
    @post = Post.new post_params
    if @post.save
      redirect_to new_posts_path(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.find params[:id]
    @comment = Comment.new
  end

  def index
    # @posts = Post.all
    @posts = Post.paginate(page: params[:page], :per_page => 10)
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    post_params = params.require(:post).permit([:title, :body])
    if @post.update post_params
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy

    redirect_to posts_path
  end
end
