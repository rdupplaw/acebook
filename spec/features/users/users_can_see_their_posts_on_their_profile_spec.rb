require 'rails_helper'

RSpec.describe 'Profile page', type: :feature do
  before do
    register
  end
  it 'shows the users posts' do
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'My Profile'
    expect(page).to have_content("Hello, world!")
  end

  it 'does not show other peoples posts' do
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link "Log Out"
    register_second_user
    click_link "My Profile"
    expect(page).not_to have_content("Hello, world!")
  end
end