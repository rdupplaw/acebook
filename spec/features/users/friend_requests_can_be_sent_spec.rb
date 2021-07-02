require 'rails_helper'

RSpec.feature 'Friend requests' do 
  before do 
    register

    click_link 'New post'
    fill_in 'Message', with: 'Test Post 1'
    click_button 'Submit'
    click_link 'Log Out'

    register_second_user 
  end

  scenario 'A signed in user can send a friend request and get a confirmation message' do
    click_link 'John Doe'
    click_link 'Add Friend'
    expect(page).to have_content 'Friend request sent to John Doe'
  end

  scenario 'A user can accept a friend request and get a confirmation message' do 
    click_link 'John Doe'
    click_link 'Add Friend'
    click_link 'Log Out'
    fill_in 'session[email]', with: 'john@example.com'
    fill_in 'session[password]', with: 'test123'
    click_button 'Log in'
    click_link 'John Doe'
    click_link 'Pending Friend Requests'
    click_link 'Accept'
    expect(page).to have_content 'You are now friends with James Doe'
  end
end
