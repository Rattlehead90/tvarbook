class UsersController < ApplicationController
  def show
    @user = params[:id].nil? ? current_user : User.find(params[:id])
    @friends = current_user.friends
  end
end
