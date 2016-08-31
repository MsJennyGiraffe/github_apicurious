class GithubService
  def initialize
    @_conn = Faraday.new("https://api.github.com/")
  end

  def get_followers(username)
    response = conn.get("users/MsJennyGiraffe/followers")
    JSON.parse(response.body)
  end

  private
    def conn
      @_conn
    end
end