def edit_profile
  click_link "My Profile"
  click_link "Edit Profile"

  fill_in "Bio", with: "This is my bio"
  fill_in "Age", with: "24"
  fill_in "Home town", with: "My town"
  fill_in "Education", with: "Some school"
  fill_in "Workplace", with: "Home"
  click_button "Save changes"
end