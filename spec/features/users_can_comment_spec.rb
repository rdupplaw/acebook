# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comments', type: :feature do
  before do
    register_and_login
  end

  it 'Can leave comments on posts' do
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'View'

    fill_in 'comment[commenter]', with: 'CharlieS'
    fill_in 'comment[body]', with: 'goodbye'
    click_button 'Create Comment'
    expect(page).to have_content('CharlieS')
    expect(page).to have_content('goodbye')
  end
end
