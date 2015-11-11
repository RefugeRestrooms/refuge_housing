def fill_in_post_form
  choose "Needed"
  fill_in "Title", with: "I need housing"
  fill_in "Email", with: "foo@bar.com"
  fill_in "Email confirmation", with: "foo@bar.com"
  fill_in "Street", with: "Adeline St."
  fill_in "City", with: "Berkeley"
  select "California", from: "State"
  select "United States", from: "Country", match: :first
  fill_in "Description", with: "Help me find housing"
end

def validated_fields
  ["Title", "City", "Email", "Email confirmation"]
end
