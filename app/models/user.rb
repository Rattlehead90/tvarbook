class User < ApplicationRecord
  include Gravtastic
  gravtastic

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy

  # Friendship mechanics
  has_many :invitations
  has_many :pending_invitations, -> { where confirmed: false }, class_name: 'Invitation',
                                                                foreign_key: 'friend_id'

  def friends
    invited_by_user = Invitation.where(user_id: id, confirmed: true).pluck(:friend_id)
    invite_user = Invitation.where(friend_id: id, confirmed: true).pluck(:user_id)
    ids = invited_by_user + invite_user
    User.where(id: ids)
  end

  def friends_with?(user)
    Invitation.request_confirmed?(id, user.id)
  end

  def requested_to_be_friends_with_by?
    arr = pending_invitations.map(&:user_id)
  end

  def send_invitation(user)
    invitations.create(friend_id: user.id)
  end

  # Likes mechanic

  has_many :likes, dependent: :destroy
end
