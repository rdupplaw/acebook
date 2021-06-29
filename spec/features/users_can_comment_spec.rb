require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  before do
    register_and_login
  end

  scenario "Can leave comments on posts" do
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "View"
    
    fill_in "comment[body]", with: "goodbye"
    click_button "Create Comment"
    expect(page).to have_content("1 comment")
    expect(current_path).to eq('/posts')
  end
end