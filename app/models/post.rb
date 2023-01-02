class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :reference, dependent: :destroy
end
