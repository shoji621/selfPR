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
    post = Post.create(post_params)
    if post.save
      redirect_to root_path
    else
      flash.now[:alert] = post.errors.full_messages
      redirect_to new_post_path
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to post_path(post.id)
    else
      flash.now[:alert] = post.errors.full_messages
      redirect_to edit_post_path
    end

  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:industry_id,:hopejob_id ,:nowjob_id, :text, :solved).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
