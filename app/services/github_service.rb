class GithubService
  def initialize(user)
    @user = user
    @_conn = Faraday.new("https://api.github.com/")
    @_conn.headers["Authorization"] = "Token #{@user.oauth_token}"
  end

  def get_followers
    response = conn.get("user/followers")
    JSON.parse(response.body)
  end

  def get_followings
    response = conn.get("user/following")
    JSON.parse(response.body)
  end

  private
    def conn
      @_conn
    end
end
