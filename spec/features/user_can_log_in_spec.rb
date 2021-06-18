require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  before(:all) do
    user = User.new(firstname: 'Example', lastname: 'User', email: 'user@example.com',
      password: 'foobar', password_confirmation: 'foobar')
    user.save
  end

  scenario 'when the user enters an incorrect email address' do
    visit login_path
    fill_in 'session[email]', with: 'use@example.com'
    fill_in 'session[password]', with: 'foobar'
    click_button 'Log in'
    expect(current_path).to eq('/login')
    expect(page).to have_content('Invalid email/password combination')
  end

  scenario 'when the user enters an incorrect password' do
  end

  scenario 'when the user enters an incorrect email address and password' do
  end

  scenario 'when the user enters correct email address and password' do
  end
end
