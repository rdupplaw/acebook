# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Timeline', type: :feature do
  it 'Can submit posts and view them' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
  end

  scenario "Can view zero likes for a post" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("0 likes")
  end

  scenario "Can click on likes and increase number of likes" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"

    click_link "Like"
    expect(page).to have_content("1 likes")
  end


end
