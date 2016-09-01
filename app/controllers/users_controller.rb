class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @followers = Follower.all(@user)
    @followings = Following.all(@user)
  end
end
