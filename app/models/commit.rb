class Commit
  def initialize(message, url)
    @message = message
    @url     = url
  end

  def self.service(user)
    @@github_service ||= GithubService.new(user)
  end

  def self.all(user)
    commits = service(user).get_commit_history
    commits.map do |commit|
      Commit.new(
        commit["message"],
        commit["url"]
      )
    end
  end
end
