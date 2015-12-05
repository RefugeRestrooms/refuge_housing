require "rails_helper"

describe "the search process", type: :feature do
  it "shows a NEEDED post nearby when I search" do
    post = create(
      :post,
      show: true
    )

    visit root_url
    fill_in "location", with: "Berkeley"
    choose "Needed"
    click_button "Search"

    expect(page).to have_content post.title
  end

  it "shows an AVAILABLE post nearby when I search" do
    post = create(
      :available_post,
      show: true
    )

    visit root_url
    fill_in "location", with: "Berkeley"
    click_button "Search"

    expect(page).to have_content post.title
  end

  it "shows a post with a query in its description" do
    post1 = create(
      :available_post,
      description: "I want some tofu pups",
      show: true
    )
    post2 = create(
      :available_post,
      title: "A different title",
      show: true
    )

    visit root_url
    fill_in "query", with: "tofu pups"
    click_button "Search"

    expect(page).to have_content post1.title
    expect(page).to have_no_content post2.title
  end

  it "shows a message if there are no posts" do
    visit root_url
    click_button "Search"

    expect(page).to have_content "Sorry"
  end
end

describe "the post submission process" do
  it "is accessible from the home link" do
    visit root_url
    click_link "New Post"

    expect(page).to have_content("Submit a New Post")
  end

  it "submits a new 'needed' post with success" do
    visit new_post_url
    fill_in_post_form
    click_button "Create Post"

    expect(page).to have_content("confirmation")
  end

  it "submits a new default post which should be 'needed'" do
    visit new_post_url
    fill_in_post_form
    click_button "Create Post"

    expect(Post.last.post_type).to eq("needed")
  end

  it "submits a new 'available' post with success" do
    visit new_post_url
    fill_in_post_form
    choose "Available"
    click_button "Create Post"

    expect(page).to have_content("confirmation")
    expect(Post.last.post_type).to eq("available")
  end

  it "invalidates blank fields" do
    visit new_post_url
    click_button "Create Post"

    validated_fields.each do |f|
      expect(page).to have_content("#{f} can't be blank")
    end
  end

  it "confirms email field" do
    visit new_post_url
    fill_in_post_form
    fill_in "Email confirmation", with: "mistake"
    click_button "Create Post"

    expect(page).to have_content("Email confirmation doesn't match Email")
  end

  it "invalidates incorrect email" do
    visit new_post_url
    fill_in "Email", with: "mistake"
    click_button "Create Post"

    expect(page).to have_content("Email is invalid")
  end
end

describe "the post confirmation process" do
  it "confirms a post from given link" do
    post = create(:post)

    visit confirm_post_url(post.id, post.validation)

    expect(page).to have_content("confirmed")
  end
end

describe "the post deletion process" do
  it "deletes a post from edit link" do
    post = create(:post)

    visit edit_post_url(post.id, validation: post.validation)
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
    # gelocator stores with state abbreviation # so form doesn't get autofilled
    select "California", from: "State"
    click_button "Update Post"

    expect(current_path).to eq(post_path(post))
    expect(page).to have_content("Edited Title")
  end
end

describe "the post showing process" do
  it "shows city/state/neighborhood but not street address" do
    post = create(:post, street: "924 Gilman Street")

    visit post_url(id: post.id)

    expect(page).to have_content(post.city)
    expect(page).to have_content(post.state)
    expect(page).to have_content(post.neighborhood)
    expect(page).to_not have_content(post.street)
  end

  it "shows map" do
    post = create(:post)

    visit post_url(id: post.id)

    expect(page).to have_css("#map")
    # We should use a JS enabled driver, so we can check if mapkit loads
  end
end
