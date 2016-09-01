require 'rails_helper'

describe Follower do
  context "all" do
    it "makes followers" do
      VCR.use_cassette("followers model") do
        user = User.create(
          uid: 1,
          name: "Jenny",
          username: "MsJennyGiraffe",
          oauth_token: ENV['GITHUB_TOKEN'],
          avatar: "avatar",
          email: "test@example.com"
        )

        followers = Follower.all(user)
        expect(followers.count).to eq(21)
        expect(followers.first.username.class).to eq(String)
        expect(followers.first.avatar.class).to eq(String)
        expect(followers.first.github_url.class).to eq(String)
      end
    end
  end
end
