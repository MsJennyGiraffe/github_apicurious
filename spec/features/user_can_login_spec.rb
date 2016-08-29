require 'rails_helper'

RSpec.feature "user can login" do
  scenario "a user with a github account can login" do
    visit "/"
    click_link "Login with Github"

    expect(page).to have_content("Hello, Jenny")
  end
end
