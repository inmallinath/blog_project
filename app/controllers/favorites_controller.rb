class FavoritesController < ApplicationController
  before_action :authenticate_user

  def index
    @favorites = current_user.favored_posts
  end

  def create
    @post = Post.friendly.find params[:post_id]
    favorite = Favorite.new(post: @post, user: current_user)
    respond_to do |format|
      if favorite.save
        format.html{redirect_to @post, notice: "Tagged as Favorite"}
        format.js{render :favorite_success}
      else
        format.html{redirect_to @post, alert: "Could not be tagged as Favorite"}
        format.js{render :favorite_failure}
      end
    end
  end

  def destroy
    @post = Post.friendly.find params[:post_id]
    fav = current_user.favorites.find params[:id]
    fav.destroy
    respond_to do |format|
      format.html{redirect_to post_path(@post), notice: "Untagged as Favorite"}
      format.js{render}
    end
  end
end
