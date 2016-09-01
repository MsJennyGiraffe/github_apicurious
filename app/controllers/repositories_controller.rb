class RepositoriesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @repositories = Repository.all(@user)
  end
end
