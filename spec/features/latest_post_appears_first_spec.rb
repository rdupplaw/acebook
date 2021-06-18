require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  before do
    register_and_login
  end

  scenario "Posts appear with the newest post first" do
    click_link "New post"
    fill_in "Message", with: "Test Post 1"
    click_button "Submit"
    click_link "New post"
    fill_in "Message", with: "Test Post 2"
    click_button "Submit"

    post1 = find('p', text: 'Test Post 1')
    post2 = find('p', text: 'Test Post 2')
    expect(post2).to appear_before(post1)
  end
end