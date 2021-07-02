require 'rails_helper'

RSpec.describe 'navbar', type: :feature do
  before do
    register
  end

  it 'navigates to posts' do
    click_link 'Posts'
    
    expect(page).to have_content("New post")
  end

  it 'navigates to My Profile' do
    click_link 'Posts'
    click_link 'John Doe'

    expect(page).to have_content("John Doe")
  end

  it 'navigates to log out page' do
    click_link 'Log Out'

    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
  end

  it 'does not navigate to posts if not logged out' do
    click_link 'Log Out'

    expect(page).not_to have_link('Posts')
  end

  it 'does not navigate to My Profile if logged out' do
    click_link 'Log Out'

    expect(page).not_to have_link('John Doe')
  end

  it 'does not navigate to posts if not logged out' do
    click_link 'Log Out'

    expect(page).not_to have_link('Log out')
  end
end