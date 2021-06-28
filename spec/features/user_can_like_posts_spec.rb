require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  before do
    register_and_login
  end

  scenario "Can view zero likes for a post" do
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("0 likes")
  end

  scenario "Can click on likes and increase number of likes" do
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "Like"
    expect(page).to have_content("1 likes")
  end


end
