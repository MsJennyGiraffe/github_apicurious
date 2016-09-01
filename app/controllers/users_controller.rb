class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @followers = Follower.all(@user.username)
  end
end
