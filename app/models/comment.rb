class Comment < ApplicationRecord
  belongs_to :user
  # has_many :favorites, foreign_key: 'Commnet_id', dependent: :destroy
  # has_many :users, through: :favorites

  validates :text, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
