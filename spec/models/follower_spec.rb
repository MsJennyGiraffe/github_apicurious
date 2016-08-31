require 'rails_helper'

describe Follower do
  context "all" do
    it "makes followers" do
      VCR.use_cassette("followers model", record: :new_episodes) do
        username = "MsJennyGiraffe"
        followers = Follower.all(username)
        expect(followers.count).to eq(21)
        expect(followers.first.username).to eq("mikedao")
        expect(followers.first.name).to eq("Michael Dao")
      end
    end
  end
end
