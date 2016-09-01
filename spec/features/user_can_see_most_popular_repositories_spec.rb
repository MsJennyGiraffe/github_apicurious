require 'rails_helper'

RSpec.feature "user can see most popular repositories" do
  scenario "user can see popular repositories on the profile page" do
    VCR.use_cassette("popular repos") do
      visit root_path
      click_link "Login with Github"
      click_link "Your profile"

      expect(page).to have_content "Popular Repositories"

      expect(page).to have_selector('.repos', count: 5)
    end
  end
end
