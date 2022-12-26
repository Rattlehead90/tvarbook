class InvitationsController < ApplicationController
  def create
    user = User.find(params[:id])
    current_user.send_invitation(user)
  end

  def destroy
  end

  def update
  end
end
