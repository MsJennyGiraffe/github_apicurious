require 'rails_helper'

describe GithubService do
  context "followers" do
    it "returns a list of followers for a specific user" do
      VCR.use_cassette("followers") do
        followers = GithubService.new.get_followers("MsJennyGiraffe")
        follower = followers.first
        expect(followers.count).to eq(21)
        expect(follower["login"]).to eq("mikedao")
        expect(follower["id"]).to eq(3011748)
      end
    end
  end
end
