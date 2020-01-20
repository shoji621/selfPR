class Posts::SolvedsController < ApplicationController
  def update
    @post = Post.find(params[:id])
    @post.update_solved_true
    redirect_to post_path(@post.id)
  end
end
