class UsersController < ApplicationController
  def show
    @user = params[:id].nil? ? current_user : User.find(params[:id])
    @friends = @user.friends
    @invitation_not_sent = Invitation.reacted?(current_user.id, @user.id)
    @invitation = Invitation.find_invitation(@user.id, current_user.id)
  end
end
