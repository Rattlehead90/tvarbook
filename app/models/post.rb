class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :reference, dependent: :destroy
  has_many :comments, dependent: :destroy

  paginates_per 10

  def liked?(user)
    !likes.where(user: user).empty?
  end

  validates :body, presence: true, length: { maximum: 760 }


end
