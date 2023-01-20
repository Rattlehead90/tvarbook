class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates_presence_of :body, :user_id, :post_id
  validates :body, length: { maximum: 300 }
end
