require 'rails_helper'

feature 'Sign up'' do
  scenario 'user can sign up' do
    visit '/users/new'
    expect(page).to have_content("Email")
    fill_in "user_firstname", with: "John"
    fill_in "user_lastname", with: "Doe"
    fill_in "user_email", with: "john@test.com"
    fill_in "user_password", with: "test123"
    click_button "Create account"
    expect(User.count).to eq(1)
  end
end
