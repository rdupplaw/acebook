# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Likes', type: :feature do
  before do
    register
    
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
  end


  scenario "Can view zero likes for a post" do
    expect(page).to have_content("0 likes")
  end

  scenario "Can click on likes and increase number of likes" do
    click_link "Like"
    expect(page).to have_content("1 like")
  end

  scenario "Can only unlike post if have already liked said post" do 
    click_link "Like"
    click_link "Unlike"
    expect(page).to have_content("0 likes")
  end

  scenario "Liking a post from the index refreshes the index" do 
    click_link "Like"
    expect(current_path).to eq('/posts')
  end

  scenario "Liking a post from the index refreshes the post#show" do 
    click_link "View"
    click_link "Like"
    expect(current_path).to eq('/posts/1')
  end
end
