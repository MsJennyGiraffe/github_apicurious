require 'rails_helper'

describe Following do
  context "all" do
    it "makes followings" do
      VCR.use_cassette("following model") do
        user = User.create(
          uid: 1,
          name: "Jenny",
          username: "MsJennyGiraffe",
          oauth_token: ENV['GITHUB_TOKEN'],
          avatar: "avatar",
          email: "test@example.com"
        )

        followings = Following.all(user)
        expect(followings.count).to eq(30)
        expect(followings.first.username.class).to eq(String)
        expect(followings.first.avatar.class).to eq(String)
        expect(followings.first.github_url.class).to eq(String)
      end
    end
  end
end
