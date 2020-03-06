class InquiriesController < ApplicationController
  before_action :set_post

  def new
    @inquiry = Inquiry.new
  end

  def create
    inquiry = Inquiry.create(inquiry_params)
    if inquiry.save
      redirect_to root_path
    else
      flash.now[:alert] = inquiry.errors.full_messages
      redirect_to new_inquiry_path
    end
  end

  private
  def inquiry_params
    params.require(:inquiry).permit(:message).merge(user_id: current_user.id)
  end


  def set_post
    @post = Post.new
  end
end
