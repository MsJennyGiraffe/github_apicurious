require 'rails_helper'

RSpec.feature "user can access followers" do
  scenario "a user can see a users followers" do
    VCR.use_cassette("Followers", record: :new_episodes) do
      visit root_path
      click_link "Login with Github"
      click_link "Your profile"

      expect(page).to have_content("Followers")
      click_link("21")
save_and_open_page
      expect(current_path).to eq(user_followers_path(4))
      expect(page).to have_content("Josh Washke")
      expect(page).to have_content("Michael Dao")
      expect(page).to have_content("Regis Boudinot")
    end
  end
end
