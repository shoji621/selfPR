class UsersController < ApplicationController
  before_action :set_post

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(params).recent
  end

  def favorite
    @user = User.find(params[:id])
    @favorite_posts = @user.favorite_posts.paginate(params).recent
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_post
    @post = Post.new
  end

end
