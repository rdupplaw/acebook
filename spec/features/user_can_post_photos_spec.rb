require 'rails_helper'

RSpec.feature "Photo post", type: :feature do 
  scenario 'a user can attach an image to their post' do 
    register_and_login

    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    attach_file 'Image', "spec/files/3000.jpeg"
    click_button "Submit"

    expect(page).to have_css("img[src*='3000.jpeg']")
  end
end