require 'rails_helper'

feature 'Sign up' do
  scenario 'user can sign up' do
    visit '/users/new'
    attach_file 'user_profile_picture', "spec/files/profile_pic.jpeg"
    fill_in "user_firstname", with: "John"
    fill_in "user_lastname", with: "Doe"
    fill_in "user_email", with: "john@example.com"
    fill_in "user_password", with: "test123"
    fill_in "user_password_confirmation", with: "test123"
    click_button "Create account"
    expect(page).to have_content("John")
    expect(page).to have_content("Doe")
    expect(page).to have_content("john@example.com")
    expect(page).to have_css("img[src*='profile_pic.jpeg']")


  #   register_and_login

  #   click_link "New post"
  #   fill_in "Message", with: "Hello, world!"
  #   attach_file 'Image', "spec/files/profile_pic.jpeg"
  #   click_button "Submit"

  #   expect(page).to have_css("img[src*='3000.jpeg']")
  end
end
