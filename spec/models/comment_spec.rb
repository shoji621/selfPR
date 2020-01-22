require 'rails_helper'
describe Comment do
  describe '#create' do

    # 1. textが存在すれば登録できること
    it "is valid with a text" do
      user = create(:user)
      post = create(:post)
      comment = build(:comment)
      expect(comment).to be_valid
    end
    # 2. textが空では登録できないこと
    it "is invalid without a text" do
      user = create(:user)
      post = create(:post)
      comment = build(:comment, text: nil)
      comment.valid?
      expect(comment.errors[:text]).to include("can't be blank")
    end
  end
end