# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Adding to profile', type: :feature do
  before do
    register
  end

  it 'user can add to profile' do
    click_link "My Profile"
    click_link "Edit Profile"

    fill_in "Bio", with: "This is my bio"
    fill_in "Age", with: "24"
    click_button "Update User"

    expect(page).to have_content("This is my bio")
    expect(page).to have_content("24")
  end

  it 'user can edit profile' do
    click_link "My Profile"
    click_link "Edit Profile"

    fill_in "Bio", with: "This is my bio"
    fill_in "Age", with: "24"
    click_button "Update User"

    click_link "Edit Profile"

    fill_in "Bio", with: "This bio is way better"
    click_button "Update User"

    expect(page).to have_content("This bio is way better")
  end
end
