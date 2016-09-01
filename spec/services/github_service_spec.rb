require 'rails_helper'

describe GithubService do
  context "followers" do
    it "returns a list of followers for a specific user" do
      VCR.use_cassette("followers") do
        user = User.create(
          uid: 1,
          name: "Jenny",
          username: "MsJennyGiraffe",
          oauth_token: ENV['GITHUB_TOKEN'],
          avatar: "avatar",
          email: "test@example.com"
        )

        followers = GithubService.new(user).get_followers
        follower = followers.first
        expect(followers.count).to eq(21)
        expect(follower["login"]).to eq("mikedao")
        expect(follower["id"]).to eq(3011748)
      end
    end
  end

  context "followings" do
    it "returns a list of followers for a specific user" do
      VCR.use_cassette("followings") do
        user = User.create(
          uid: 1,
          name: "Jenny",
          username: "MsJennyGiraffe",
          oauth_token: ENV['GITHUB_TOKEN'],
          avatar: "avatar",
          email: "test@example.com"
        )

        followings = GithubService.new(user).get_followings
        following = followings.first
        expect(followings.count).to eq(30)
        expect(following.has_key?("login")).to be_truthy
        expect(following.has_key?("avatar_url")).to be_truthy
        expect(following.has_key?("html_url")).to be_truthy
      end
    end
  end

  context "starred_repos" do
    it "returns a list of repos that the user has starred" do
      VCR.use_cassette("starred") do
        user = User.create(
          uid: 1,
          name: "Jenny",
          username: "MsJennyGiraffe",
          oauth_token: ENV['GITHUB_TOKEN'],
          avatar: "avatar",
          email: "test@example.com"
        )

        starred_repos = GithubService.new(user).get_starred_repos
        expect(starred_repos.count).to eq(1)
      end
    end
  end
end
