class Repository
  attr_reader :name, :url, :stars, :owner

  def initialize(name, url, stars, owner=nil)
    @name = name
    @url = url
    @stars = stars
    @owner = owner
  end

  def self.service(user)
    @@service ||= GithubService.new(user)
  end

  def self.top_five(user)
    popular_repositories = service(user).get_popular_repositories
    popular_repositories.map do |repo|
      Repository.new(
        repo["name"],
        repo["html_url"],
        repo["stargazers_count"],
      )
    end
  end

  def self.all(user)
    repositories = service(user).get_repositories
    repositories.map do |repo|
      Repository.new(
        repo["name"],
        repo["html_url"],
        repo["stargazers_count"],
        repo["owner"]["login"]
      )
    end
  end
end
