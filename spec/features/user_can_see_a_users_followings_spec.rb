require 'rails_helper'

RSpec.feature "user can access followeings" do
  scenario "a user can see a users followings" do
    VCR.use_cassette("see followings", record: :new_episodes) do
      visit root_path
      click_link "Login with Github"
      click_link "Your profile"

      expect(page).to have_content("Followings")
      click_link("30")

      expect(page).to have_content("jwashke")
      expect(page).to have_content("mikedao")
      expect(page).to have_content("selfup")
    end
  end
end
