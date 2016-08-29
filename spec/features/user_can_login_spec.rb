require 'rails_helper'

RSpec.feature "user can login" do
  scenario "a user with a github account can login" do
      visit "/"
      click_link "Login with Github"
      expect(current_path).to eq("/")
      expect(page).to have_content("MsJennyGiraffe")
      expect(page).to have_content("Logout")
      expect(page).to_not have_content("Login with Github")
  end

  scenario "a logged in user can logout" do
    visit "/"
    click_link "Login with Github"

    expect(page).to have_content("MsJennyGiraffe")
    expect(page).to_not have_content("Login with Github")

    click_link "Logout"
    expect(page).to have_content("Login with Github")
    expect(page).to_not have_content("MsJennyGiraffe")
  end
end
