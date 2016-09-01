require 'rails_helper'

describe Repository do
  context "top_five" do
    it "makes top five popular repositories" do
      VCR.use_cassette("popular repositories") do
        user = User.create(
          uid: 1,
          name: "Jenny",
          username: "MsJennyGiraffe",
          oauth_token: ENV['GITHUB_TOKEN'],
          avatar: "avatar",
          email: "test@example.com"
        )

        popular_repositories = Repository.top_five(user)
        repo = popular_repositories.first
        expect(popular_repositories.count).to eq(5)
        expect(repo.name).to eq("mix_master")
        expect(repo.url.class).to eq(String)
        expect(repo.stars).to eq(1)
      end
    end
  end

  context "all" do
    it "makes user repositories" do
      VCR.use_cassette("all repos") do
        user = User.create(
          uid: 1,
          name: "Jenny",
          username: "MsJennyGiraffe",
          oauth_token: ENV['GITHUB_TOKEN'],
          avatar: "avatar",
          email: "test@example.com"
        )

        repos = Repository.all(user)
        repo = repos.first
        expect(repos.count).to eq(30)
        expect(repo.name.class).to eq(String)
        expect(repo.url.include?(".com")).to be true
        expect(repo.owner).to eq("AnnaCW")
      end
    end
  end
end
