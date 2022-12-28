class UsersController < ApplicationController
  def show
    @user = params[:id].nil? ? current_user : User.find(params[:id])
    @friends = @user.friends
    @invitation = Invitation.reacted?(current_user.id, @user.id)
  end
end
