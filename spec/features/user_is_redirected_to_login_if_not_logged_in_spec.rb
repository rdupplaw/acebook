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
end
