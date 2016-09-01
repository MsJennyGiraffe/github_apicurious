class FollowingsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @followings = Following.all(@user)
  end
end
