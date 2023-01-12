class UsersController < ApplicationController
  def index
    @users = User.order(:last_name).page params[:page]
    @user = current_user
    @invitation_not_sent = Invitation.request_sent?(current_user.id, @user.id)
    @invitation = Invitation.find_invitation(@user.id, current_user.id)
  end

  def show
    @user = params[:id].nil? ? current_user : User.find(params[:id])
    @friends = @user.friends
    @invitation_not_sent = Invitation.request_sent?(current_user.id, @user.id)
    @invitation = Invitation.find_invitation(@user.id, current_user.id)
    @flag = EmojiFlag.new(@user.country)
  end
end
