require 'rails_helper'

RSpec.feature "Redirect to login", type: :feature do
  it 'posts page redirects to login page' do
    visit '/posts'

    expect(current_path).to eq('/login')
  end

  it 'flashes error message when not logged in' do
    visit '/posts'

    expect(page).to have_content('You must be logged in to access this section')
  end

  it 'signup page does not redirect to login page' do
    visit '/users/new'

    expect(current_path).to eq('/users/new')
  end
end
