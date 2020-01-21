class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  include Paginate
  attr_accessor :keyword
  belongs_to_active_hash :industry
  belongs_to_active_hash :hopejob
  belongs_to_active_hash :nowjob
  has_many :comments
  belongs_to :user
  has_many :favorites, foreign_key: 'Post_id', dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user


  validates :solved, inclusion: {in: [true, false]}
  validates :text, presence: true

  scope :recent, -> { order("created_at DESC") }

  def self.search(search)
    return Post.all unless search
    Post.where('text LIKE(?)', "%#{search}%")
  end

  def update_solved_true
    self.solved = true if self.solved == false
    self.save
  end
  
  # ユーザーが投稿をお気に入りしたかどうかの判定メソッド
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
