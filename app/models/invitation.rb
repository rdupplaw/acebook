class Invitation < ApplicationRecord
  belongs_to :user

  def self.reacted?(id1, id2)
    case1 = !Invitation.where(user_id: id1, friend_id: id2).empty?
    case2 = !Invitation.where(user_id: id2, friend_id: id1).empty?
    case1 || case2
  end

  def self.incoming_request?(id1)
    case1 = Invitation.where(user_id: id1, confirmed: false)
    case1.exists?
  end

  def self.pending_request?(id1, id2)
    case1 = Invitation.where(user_id: id2, friend_id: id1, confirmed: false)
    case2 = Invitation.where(user_id: id1, friend_id: id2, confirmed: false)
    case1.exists? || case2.exists?
  end

  def self.confirmed_record?(id1, id2)
    case1 = !Invitation.where(user_id: id1, friend_id: id2, confirmed: true).empty?
    case2 = !Invitation.where(user_id: id2, friend_id: id1, confirmed: true).empty?
    case1 || case2
  end

  def self.find_invitation(id1, id2)
    if Invitation.where(user_id: id1, friend_id: id2, confirmed: true).empty?
      case1 = !Invitation.where(user_id: id2, friend_id: id1, confirmed: true)[0].id
    else 
      Invitation.where(user_id: id1, friend_id: id2, confirmed: true)[0].id
    end
  end
end
