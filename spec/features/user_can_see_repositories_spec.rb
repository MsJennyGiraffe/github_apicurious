require 'rails_helper'

RSpec.feature "user can see all repos" do
  scenario "a user can see a users repositories" do
    VCR.use_cassette("repositories", record: :new_episodes) do
      visit root_path
      click_link "Login with Github"
      click_link "Your profile"
      click_link("View All Repositories")

      expect(page).to have_content("black_thursday")
      expect(page).to have_content("AnnaCW")
    end
  end
end
