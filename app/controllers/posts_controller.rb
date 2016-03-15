require 'will_paginate/array'
class PostsController < ApplicationController

before_action :find_post, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user, except: [:index, :show]
before_action :authorize_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.user = current_user
    if @post.save
      if @post.tweet_it
        client = Twitter::REST::Client.new do |config|
          config.consumer_key        = ENV["twitter_consumer_key"]
          config.consumer_secret     = ENV["twitter_consumer_secret"]
          config.access_token        = current_user.twitter_token
          config.access_token_secret = current_user.twitter_secret
        end
        client.update("New Blog Post: #{@post.title.titleize}")
      end
      flash[:notice] = "Post created successfully"
      redirect_to new_posts_path(@post), notice: "Post has been created!"
    else
      flash.now[:alert] = "Post wasn't created. Check errors below"
      render :new
    end
  end

  def show
    @comment = Comment.new
    respond_to do |format|
      format.html{ render }
      format.json{ render json: @post}
    end
  end

  def index
    @ajax_posts = Post.order("created_at DESC")
    if params[:search]
      @results = Post.search(params[:search]).order("created_at DESC")
    else
      @results = Post.order("created_at DESC")
    end
    @posts = @results.paginate(page: params[:page], :per_page => 5)
    respond_to do |format|
      format.html{ render }
      format.json{ render json: @ajax_posts.select(:id, :title, :created_at, :user_id, :category_id) }
    end
  end

  def index_user
    # @posts = Post.all
    @results = current_user.posts.order("created_at DESC")
    @posts = @results.paginate(page: params[:page], :per_page => 5)
  end

  def edit
  end

  def update
    @post.slug = nil
    if @post.update post_params
      redirect_to post_path(@post), notice: "Post has been updated!"
    else
      flash.now[:alert] = "Post could not be updated!"
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, alert: "Post has been removed!"
  end

  private

  def find_post
    @post = Post.friendly.find params[:id]
  end

  def post_params
    post_params = params.require(:post).permit([:title, :body, :category_id, :image, :tweet_it])
  end

  def authorize_user
    redirect_to root_path, alert: "Access Denied" unless can? :manage, @post
  end
end
