require 'rails_helper'

RSpec.feature 'Comments and Users' do 
  scenario 'username appears next to your comment' do 
    register_and_login

    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "View"

    fill_in "comment[body]", with: "goodbye"
    click_button "Create Comment"
    expect(page).to have_content("John")
  end
end