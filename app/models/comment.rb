class Comment < ApplicationRecord
  belongs_to :user
  validates :text, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
