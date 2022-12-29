class Invitation < ApplicationRecord
  belongs_to :user

  def self.request_sent?(id1, id2)
    case1 = !Invitation.where(user_id: id1, friend_id: id2, confirmed: false).empty?
    case2 = !Invitation.where(user_id: id2, friend_id: id1, confirmed: false).empty?
    case1 || case2
  end

  def self.request_confirmed?(id1, id2)
    case1 = !Invitation.where(user_id: id1, friend_id: id2, confirmed: true).empty?
    case2 = !Invitation.where(user_id: id2, friend_id: id1, confirmed: true).empty?
    case1 || case2
  end

  def self.find_invitation(id1, id2, acceptance=false)
    if Invitation.where(user_id: id1, friend_id: id2, confirmed: acceptance).empty?
      Invitation.where(user_id: id2, friend_id: id1, confirmed: acceptance)[0]
    else
      Invitation.where(user_id: id1, friend_id: id2, confirmed: acceptance)[0]
    end
  end
end
