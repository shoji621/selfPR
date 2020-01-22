class Relationship < ApplicationRecord
  belongs_to :following, class_name: "User"
  belongs_to :follower, class_name: "User"

  validates :following_id             , presence: true, numericality: { only_integer: true }
  validates :follower_id              , presence: true, numericality: { only_integer: true }

end
