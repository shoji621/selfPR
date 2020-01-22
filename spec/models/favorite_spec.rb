require 'rails_helper'
describe Favorite do
  describe '#create' do

    # 1. user_id, post_idが存在すれば登録できること
    it "is valid with a user_id, post_id" do
      user = create(:user)
      post = create(:post)
      favorite = build(:favorite, user_id: user.id, post_id: post.id)
      expect(favorite).to be_valid
    end
    # 2. user_idが空では登録できないこと
    it "is invalid without a user_id" do
      post = create(:post)
      favorite = build(:favorite, user_id: nil, post_id: post.id)
      favorite.valid?
      expect(favorite.errors[:user]).to include("must exist")
    end
    # 3. post_idが空では登録できないこと
    it "is invalid without a post_id" do
      user = create(:user)
      favorite = build(:favorite, user_id: user.id, post_id: nil)
      favorite.valid?
      expect(favorite.errors[:post]).to include("must exist")
    end
  end
end