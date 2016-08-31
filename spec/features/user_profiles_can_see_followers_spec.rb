require 'rails_helper'

RSpec.feature "user can access followers" do
  scenario "a user can see a users followers" do
    VCR.use_cassette("Followers") do
      visit root_path
      click_link "Login with Github"
      click_link "Your profile"

      expect(page).to have_content("Followers")
      click_link("21")

      expect(current_path).to eq(followers_path)
      expect(page).to have_content("Josh Washke")
      expect(page).to have_content("Mike Dao")
      expect(page).to have_content("Regis Boudinot")
    end
  end
end
