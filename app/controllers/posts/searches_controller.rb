class Posts::SearchesController < ApplicationController
  before_action :set_post
  before_action :set_ransack

  def index
    @posts = Post.search(params[:post][:keyword]).includes(:user).paginate(params).recent
  end

  def detail_search
    @posts = @q.result.includes(:user).paginate(params).recent
  end
  
  private
  def set_post
    @post = Post.new
  end

  def set_ransack
    @q = Post.ransack(params[:q])
  end
end
