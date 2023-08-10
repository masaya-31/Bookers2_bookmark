class Book < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
end
