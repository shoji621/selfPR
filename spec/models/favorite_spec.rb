require 'rails_helper'
describe Favorite do
  describe '#create' do
    # 1. user_idが空では登録できないこと
    it "is invalid without a user_id" do
      favorite = build(:favorite, user_id: nil)
      favorite.valid?
      expect(favorite.errors[:user]).to include("must exist")
    end
    # 2. post_idが空では登録できないこと
    it "is invalid without a post_id" do
      favorite = build(:favorite, post_id: nil)
      favorite.valid?
      expect(favorite.errors[:post]).to include("must exist")
    end
  end
end