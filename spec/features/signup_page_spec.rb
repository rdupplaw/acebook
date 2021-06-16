require 'rails_helper'

feature 'Visitors can sign up' do
  scenario 'via email' do
    visit sign_up_path
    expect(page).to have_content("Email")
  end
end
