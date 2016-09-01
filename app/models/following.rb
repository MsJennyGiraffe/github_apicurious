class Following
  attr_reader :username, :avatar, :github_url

  def initialize(login, avatar, github_url)
    @username = login
    @avatar = avatar
    @github_url = github_url
  end

  def self.service(user)
    @@github_service ||= GithubService.new(user)
  end

  def self.all(user)
    followings = service(user).get_followings
    followings.map do |following|
      Following.new(
        following["login"],
        following["avatar_url"],
        following["html_url"],
      )
    end
  end
end
