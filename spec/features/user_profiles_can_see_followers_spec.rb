require 'rails_helper'

RSpec.feature "user can access followers" do
  scenario "a user can see a users followers" do
    VCR.use_cassette("see followers", record: :new_episodes) do
      visit root_path
      click_link "Login with Github"
      click_link "Your profile"

      expect(page).to have_content("Followers")
      click_link("21")

      expect(page).to have_content("jwashke")
      expect(page).to have_content("mikedao")
      expect(page).to have_content("selfup")
    end
  end
end
