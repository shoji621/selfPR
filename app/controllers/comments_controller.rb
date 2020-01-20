class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to post_path(params[:post_id])  }
        format.json
      end
    else
      flash.now[:alert] = 'コメントを入力してください。'
      redirect_to post_path(params[:post_id])
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
