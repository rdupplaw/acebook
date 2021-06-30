# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comments', type: :feature do
  before do
    register
  end

  it 'Can be deleted' do
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'View'

    fill_in 'comment[body]', with: 'goodbye'
    click_button 'Create Comment'


    click_link "View"
    click_link "Delete"
    
    expect(page).not_to have_content("TestUser")
    expect(page).not_to have_content("goodbye")

  end
end
