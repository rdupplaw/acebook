require 'rails_helper'

RSpec.feature 'friends list' do 
  scenario 'users can view their friends' do 
    register

    click_link 'New post'
    fill_in 'Message', with: 'Test Post 1'
    click_button 'Submit'
    click_link 'Log Out'

    register_second_user 

    click_link 'John Doe'
    click_link 'Add Friend'
    click_link 'Log Out'
    fill_in 'session[email]', with: 'john@example.com'
    fill_in 'session[password]', with: 'test123'
    click_button 'Log in'
    click_link("John Doe", :match => :first)
    click_link 'Pending Friend Requests'
    click_link 'Accept'
    click_link("John Doe", :match => :first)
    click_link "Friends List"
    expect(page).to have_link "James Doe"
  end
end