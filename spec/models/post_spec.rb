require 'rails_helper'
describe Post do
  describe '#create' do

    # 1. industry_id, hopejob_id, nowjob_id, textが存在すれば登録できること
    it "is valid with a industry_id, hopejob_id, nowjob_id, text" do
      user = create(:user)
      post = build(:post)
      expect(post).to be_valid
    end
    # 2. industry_idが空では登録できないこと
    it "is invalid without a industry_id" do
      user = create(:user)
      post = build(:post, industry_id: nil)
      post.valid?
      expect(post.errors[:industry_id]).to include("can't be blank")
    end
    # 3. hopejob_idが空では登録できないこと
    it "is invalid without a hopejob_id" do
      user = create(:user)
      post = build(:post, hopejob_id: nil)
      post.valid?
      expect(post.errors[:hopejob_id]).to include("can't be blank")
    end
    # 4. nowjob_idが空では登録できないこと
    it "is invalid without a nowjob_id" do
      user = create(:user)
      post = build(:post, nowjob_id: nil)
      post.valid?
      expect(post.errors[:nowjob_id]).to include("can't be blank")
    end
    # 5. textが空では登録できないこと
    it "is invalid without a text" do
      user = create(:user)
      post = build(:post, text: nil)
      post.valid?
      expect(post.errors[:text]).to include("can't be blank")
    end
  end
end