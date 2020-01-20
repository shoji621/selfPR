class Posts::SearchesController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.search(params[:post][:keyword]).paginate(params).recent
  end
end
