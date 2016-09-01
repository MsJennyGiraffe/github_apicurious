class GithubService
  def initialize(user)
    @user = user
    @_conn = Faraday.new("https://api.github.com/")
    @_conn.headers["Authorization"] = "Token #{@user.oauth_token}"
  end

  def get_followers
    response = conn.get("user/followers")
    parse(response.body)
  end

  def get_followings
    response = conn.get("user/following")
    parse(response.body)
  end

  def get_starred_repos
    response = conn.get("user/starred")
    parse(response.body)
  end

  def get_popular_repositories
    response = conn.get("search/repositories?q=user:#{@user.username}&sort=stars")
    repos = parse(response.body)
    repos = repos["items"][0..4]
  end

  def get_commit_history
    response = conn.get("users/#{@user.username}/events")
    commits = parse(response.body)
    commits.each do |commit|
      commits["payload"]["commits"]
    end
  end

  private
    def conn
      @_conn
    end

    def parse(response)
      JSON.parse(response)
    end
end
