require 'rails_helper'

RSpec.describe 'Default profile picture', type: :feature do
  context 'when the user does not have a profile picture' do
    before do
      register_without_picture
    end

    it 'shows the default profile picture on their posts' do
      click_link 'New post'
      fill_in 'Message', with: 'Test Post 1'
      click_button 'Submit'

      expect(page).to have_css("img[src*='/assets/default_profile_picture']")
    end

    it 'shows the default profile picture on their profile' do
      click_link 'John Doe'

      expect(page).to have_css("img[src*='/assets/default_profile_picture']")
    end
  end
end