# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Adding to profile', type: :feature do
  before do
    register
  end

  it 'user can add a bio' do
    click_link "My Profile"
    fill_in "Profile", with: "This is my bio"
    click_button "Update User"

    click_link "My Profile"

    expect(page).to have_content("This is my bio")
  end
end
