class PopularRepository
  attr_reader :name, :url, :stars

  def initialize(name, url, stars)
    @name = name
    @url = url
    @stars = stars
  end

  def self.service(user)
    @@service ||= GithubService.new(user)
  end

  def self.top_five(user)
    popular_repositories = service(user).get_popular_repositories
    popular_repositories.map do |repo|
      PopularRepository.new(
      repo["name"],
      repo["html_url"],
      repo["stargazers_count"],
    )
    end
  end
end
