# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Redirect to login', type: :feature do
  it 'posts page redirects to login page' do
    visit '/posts'

    expect(page).to have_current_path('/login')
  end

  it 'flashes error message when not logged in' do
    visit '/posts'

    expect(page).to have_content('You must be logged in to access this section')
  end

  it 'signup page does not redirect to login page' do
    visit '/users/new'

    expect(page).to have_current_path('/users/new')
  end
end
