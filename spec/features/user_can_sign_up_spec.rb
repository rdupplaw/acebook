require 'rails_helper'

feature 'Sign up' do
  scenario 'user can sign up' do
    visit '/users/new'
    fill_in "user_firstname", with: "John"
    fill_in "user_lastname", with: "Doe"
    fill_in "user_email", with: "john@example.com"
    fill_in "user_password", with: "test123"
    fill_in "user_password_confirmation", with: "test123"
    click_button "Create account"
    expect(page).to have_content("John")
    expect(page).to have_content("Doe")
    expect(page).to have_content("john@example.com")
  end
end
