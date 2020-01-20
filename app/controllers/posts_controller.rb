class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show]

  def index
    @post = Post.new
    @posts = Post.includes(:user).paginate(params).recent
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to root_path
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:industry,:hopejob ,:nowjob, :text, :solved).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
