class FollowersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @followers = Follower.all(@user.username)
  end
end
