class FavoritesController < ApplicationController
  def create
    # こう記述することで、「current_userに関連したFavoriteクラスの新しいインスタンス」が作成可能。
    # つまり、favorite.user_id = current_user.idが済んだ状態で生成されている。
    # buildはnewと同じ意味で、アソシエーションしながらインスタンスをnewする時に形式的に使われる。
    # respond_to do |format|
    #   format.html {
        favorite = current_user.favorites.build(post_id: params[:post_id])
        favorite.save
        redirect_to posts_path
    #   }
    #   format.json {
    #     post = Post.find(params[:post_id])
    #     render json: post.id
    #   }
    # end
  end

  def destroy
    # respond_to do |format|
    #   format.html { 
        favorite = Favorite.find_by(post_id: params[:post_id], user_id: current_user.id)
        favorite.destroy
        redirect_to posts_path
    #   }
    #   format.json {
    #     post = Post.find(params[:post_id])
    #     render json: post.id
    #   }
    # end
  end
end

