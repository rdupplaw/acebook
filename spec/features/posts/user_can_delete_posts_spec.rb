# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Timeline', type: :feature do
  before do
    register
  end

  context "A post belonging to a user" do
    it 'can be removed' do
      click_link "New post"
      fill_in "Message", with: "Hello, world!"
      click_button "Submit"
      
      click_link "Delete"
      
      expect(page).not_to have_content("Hello, world!")
    end
  end

  context 'A post not belonging to a user' do
    it "can't be removed" do
      click_link "New post"
      fill_in "Message", with: "Hello, world!"
      click_button "Submit"
      click_link "Log Out"

      register_second_user

      expect(page).not_to have_link("Delete")
    end
  end
end
