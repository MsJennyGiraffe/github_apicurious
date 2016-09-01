class Follower
  attr_reader :username, :avatar, :github_url

  def initialize(login, avatar, github_url)
    @username   = login
    @avatar     = avatar
    @github_url = github_url
  end

  def self.service(user)
    @@github_service ||= GithubService.new(user)
  end

  def self.all(user)
    followers = service(user).get_followers
    followers.map do |follower|
      Follower.new(
        follower["login"],
        follower["avatar_url"],
        follower["html_url"],
      )
    end
  end
end
