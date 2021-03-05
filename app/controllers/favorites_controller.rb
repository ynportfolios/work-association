class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(blog_id: params[:blog_id])
    redirect_to blogs_url, notice: "#{favorite.blog.user.name}さんの投稿をお気に入り登録しました"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to blogs_url, notice: "#{favorite.blog.user.name}さんの投稿をお気に入り解除しました"
  end
  def show
    if current_user
      @blogs = current_user.favorite_blogs
    end
  end
end
