class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :reference, dependent: :destroy
  has_many :comments, dependent: :destroy

  def liked?(user)
    !likes.where(user: user).empty?
  end
end
