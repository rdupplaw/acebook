require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  scenario "Can leave comments on posts" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    fill_in "comment[commenter]", with: "CharlieS"
    fill_in "comment[body]", with: "goodbye"
    click_button "Create Comment"
    expect(page).to have_content("CharlieS")
    expect(page).to have_content("goodbye")
  end
end