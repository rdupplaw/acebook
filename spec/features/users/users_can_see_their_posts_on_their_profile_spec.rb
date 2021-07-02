require 'rails_helper'

RSpec.describe 'Profile page', type: :feature do
  before do
    register
  end
  it 'shows the users posts' do
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    first('.topnav').click_link('John Doe')
    expect(page).to have_content("Hello, world!")
  end

  it 'does not show other peoples posts' do
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link "Log Out"
    register_second_user
    first('.topnav').click_link('James Doe')
    expect(page).not_to have_content("Hello, world!")
  end
end