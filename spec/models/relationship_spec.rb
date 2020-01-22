require 'rails_helper'
describe Relationship do
  describe '#create' do

    # 1. following_id, follower_idが存在すれば登録できること
    it "is valid with a following_id, follower_id" do
      user = create(:user)
      another_user = create(:user)
      relationship = build(:relationship, following_id: user.id, follower_id: another_user.id)
      expect(relationship).to be_valid
    end
    # 2. following_idが空では登録できないこと
    it "is invalid without a following_id" do
      user = create(:user)
      relationship = build(:relationship, following_id: nil, follower_id: user.id)
      relationship.valid?
      expect(relationship.errors[:following]).to include("must exist")
    end
    # 3. follower_idが空では登録できないこと
    it "is invalid without a follower_id" do
      user = create(:user)
      relationship = build(:relationship, following_id: user.id, follower_id: nil)
      relationship.valid?
      expect(relationship.errors[:follower]).to include("must exist")
    end
  end
end