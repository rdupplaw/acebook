# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Timeline', type: :feature do
  before do
    register_and_login
  end

  it 'Can submit posts and view them' do
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_css("img[src*='profile_pic.jpeg']")
  end

  it 'Displays other users profile pic next to post' do
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'Log Out'

    register_second_user

    expect(page).to have_css("img[src*='profile_pic.jpeg']")
  end
end
