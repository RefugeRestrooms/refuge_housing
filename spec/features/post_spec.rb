require "rails_helper"

describe "the search process", type: :feature do
  it "shows a post nearby when I search" do
    post = create(:post, city: "Berkeley", state: "California", show: true)

    visit root_url
    fill_in "search", with: "Berkeley, California"
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

describe "the post confirmation process" do
  it "confirms a post from given link" do
    post = create(:post)

    visit posts_confirm_url(id: post.id, validation: post.validation)

    expect(page).to have_content("confirmed")
  end
end

describe "the post deletion process" do
  it "deletes a post from given link" do
    post = create(:post)

    visit posts_delete_url(id: post.id, validation: post.validation)
    click_button "Delete"

    expect(page).to have_content("successfully")
  end
end

describe "the edit process" do
  it "can edit a post from given link" do
    post = create(:post)

    visit edit_post_url(id: post.id, validation: post.validation)

    expect(page).to have_content("Editing Post")
  end

  it "can successfully submit update" do
    post = create(:post)

    visit edit_post_url(id: post.id, validation: post.validation)
    fill_in "Title", with: "Edited Title"
    # gelocator stores with state abbreviation
    # so form doesn't get autofilled
    select "California", from: "State"
    click_button "Update Post"

    expect(current_path).to eq(post_path(post))
    expect(page).to have_content("Edited Title")
  end
end
