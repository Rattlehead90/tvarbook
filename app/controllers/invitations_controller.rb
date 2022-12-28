class InvitationsController < ApplicationController
  def create
    user = User.find(params[:id])
    current_user.send_invitation(user)

    redirect_to user
  end

  def destroy
    user = User.find(params[:id])
    @invitation = Invitation.find_invitation(current_user.id, user.id)
    @invitation.destroy

    redirect_to user
  end

  def update
    user = User.find(params[:id])
    @invitation = Invitation.find_invitation(current_user.id, user.id, true)
    @invitation.destroy

    redirect_to user
  end
end
