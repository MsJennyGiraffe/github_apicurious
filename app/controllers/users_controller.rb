class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @followers = Follower.all(@user)
    @followings = Following.all(@user)
    @starred_count = GithubService.new(@user).get_starred_repos.count
    @popular_repositories = Repository.top_five(@user)
  end
end
