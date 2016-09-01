class Follower
  attr_reader :username, :avatar, :github_url, :name

  def initialize(login, avatar, github_url, name)
    @username = login
    @avatar = avatar
    @github_url = github_url
    @name = name
  end

  def self.service
    @@github_service ||= GithubService.new
  end

  def self.all(username)
    followers = service.get_followers(username)
    followers.map do |follower|
      Follower.new(
        follower["login"],
        follower["avatar_url"],
        follower["html_url"],
        get_name(follower["login"])
      )
    end
  end

  def self.get_name(follower_login)
    follower = service.get_name(follower_login)
    name = follower["name"]
  end
end
