require "rails_helper"

describe "the contact process", type: :feature do
  it "is accessible from the home link" do
    visit root_url
    click_link "Contact"

    expect(page).to have_content "Send us a message"
  end

  it "flashes success with valid form input" do
    visit contact_url
    fill_in "Name", with: "Beyonce"
    fill_in "Email", with: "beyonce@flawless.com"
    fill_in "Message", with: "you are flawless"
    click_button "Send message"

    expect(page).to have_content "Thank you for your message."
  end

  it "flashes failure with invalid email" do
    visit contact_url
    fill_in "Name", with: "Beyonce"
    fill_in "Email", with: "beyonce"
    fill_in "Message", with: "it's ok you're still flawless"
    click_button "Send message"

    expect(page).to have_content "Cannot send"
  end

  it "flashes failure without email" do
    visit contact_url
    fill_in "Name", with: "Beyonce"
    fill_in "Message", with: "it's ok you're still flawless"
    click_button "Send message"

    expect(page).to have_content "Cannot send"
  end

  it "flashes failure without name" do
    visit contact_url
    fill_in "Email", with: "beyonce"
    fill_in "Message", with: "it's ok you're still flawless"
    click_button "Send message"

    expect(page).to have_content "Cannot send"
  end

  it "flashes failure without message" do
    visit contact_url
    fill_in "Name", with: "Beyonce"
    fill_in "Email", with: "beyonce"
    click_button "Send message"

    expect(page).to have_content "Cannot send"
  end
end
