class UsersController < ApplicationController
  def show
    @user = current_user
    @friends = current_user.friends
  end
end
