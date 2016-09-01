require 'rails_helper'

describe PopularRepository do
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

        popular_repositories = PopularRepository.top_five(user)
        repo = popular_repositories.first
        expect(popular_repositories.count).to eq(5)
        expect(repo.name).to eq("mix_master")
        expect(repo.url.class).to eq(String)
        expect(repo.stars).to eq(1)
      end
    end
  end
end
