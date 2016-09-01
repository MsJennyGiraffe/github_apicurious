require 'rails_helper'

describe Commit do
  context "all" do
    it "makes commits" do
      VCR.use_cassette("commit") do
        user = User.create(
          uid: 1,
          name: "Jenny",
          username: "MsJennyGiraffe",
          oauth_token: ENV['GITHUB_TOKEN'],
          avatar: "avatar",
          email: "test@example.com"
        )

        commits = Commit.all(user)
        byebug
        expect(commits.count).to eq(29)
      end
    end
  end
end
