class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    if @comment.save
    else
      flash.now[:alert] = 'コメントを入力してください。'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @id_name = "#comment-#{@comment.id}"
    if @comment.destroy
    else
      flash.now[:alert] = 'コメントを削除できませんでした。'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
