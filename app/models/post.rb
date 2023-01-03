class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :reference, dependent: :destroy

  def liked?(user)
    !likes.where(user: user).empty?
  end
end
