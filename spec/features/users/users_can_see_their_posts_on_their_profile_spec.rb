require 'rails_helper'

RSpec.describe 'Profile page', type: :feature do
  before do
    register
  end
  it 'shows the users posts' do
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link "Profile"
    expect(page).to have_content("Hello, world!")

  end
end