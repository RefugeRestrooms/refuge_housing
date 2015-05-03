require "rails_helper"

describe "the search process", type: :feature do
  it "shows a post nearby when I search" do
    post = create(:post, city: "Berkeley", state: "CA", show: true)

    visit root_url
    fill_in "search", with: "Berkeley, CA"
    click_button "Search"

    expect(page).to have_content post.title
  end
end

describe "the post submission process" do
  it "submits a new post with success" do
    visit new_post_url
    fill_in_post_form
    click_button "Create Post"

    expect(page).to have_content("confirmation")
  end
end
