require "rails_helper"

describe "visiting the about page", type: :feature do
  it "is accessible from the home link" do
    visit root_url
    click_link "About"

    expect(page).to have_content "About Refuge Housing"
  end
end
