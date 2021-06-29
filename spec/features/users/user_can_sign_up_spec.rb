# frozen_string_literal: true

require 'rails_helper'

feature 'Sign up' do
  before do
    register
  end
  scenario 'user can sign up' do
    visit '/users/1'
    expect(page).to have_content("John")
    expect(page).to have_content("Doe")
    expect(page).to have_content("john@example.com")
    expect(page).to have_css("img[src*='profile_pic.jpeg']")
  end

  scenario "user does not have to log in" do
    visit posts_path
    expect(current_path).to eq('/posts')
  end
end
