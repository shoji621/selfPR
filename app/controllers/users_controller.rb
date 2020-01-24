class UsersController < ApplicationController
  before_action :set_user, except: [:edit, :update]
  before_action :set_post

  def show
    @posts = @user.posts.paginate(params).recent
  end

  def favorite
    @favorite_posts = @user.favorite_posts.includes(:user).paginate(params).recent
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
    @users = @user.followings
  end

  def followers
    @users = @user.followers
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_post
    @post = Post.new
  end

end
