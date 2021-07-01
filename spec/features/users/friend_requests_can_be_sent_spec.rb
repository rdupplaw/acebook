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

  scenario 'A signed in user can send a friend request' do
    
    click_link 'John Doe'
    expect(page).to have_link('Add Friend')
  end
end