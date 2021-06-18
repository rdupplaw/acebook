require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  before do
    user = User.new(firstname: 'Example', lastname: 'User', email: 'user@example.com',
      password: 'foobar', password_confirmation: 'foobar')
    user.save
  end

  scenario 'login fails when the user enters an incorrect email address' do
    visit login_path
    fill_in 'session[email]', with: 'use@example.com'
    fill_in 'session[password]', with: 'foobar'
    click_button 'Log in'
    expect(current_path).to eq('/login')
    expect(page).to have_content('Invalid email/password combination')
  end

  scenario 'login fails when the user enters an incorrect password' do
    visit login_path
    fill_in 'session[email]', with: 'user@example.com'
    fill_in 'session[password]', with: 'foobarr'
    click_button 'Log in'
    expect(current_path).to eq('/login')
    expect(page).to have_content('Invalid email/password combination')
  end

  scenario 'login fails when the user enters an incorrect email address and password' do
    visit login_path
    fill_in 'session[email]', with: 'use@example.com'
    fill_in 'session[password]', with: 'foobarr'
    click_button 'Log in'
    expect(current_path).to eq('/login')
    expect(page).to have_content('Invalid email/password combination')
  end

  scenario 'login succeeds when the user enters correct email address and password' do
    visit login_path
    fill_in 'session[email]', with: 'user@example.com'
    fill_in 'session[password]', with: 'foobar'
    click_button 'Log in'
    expect(current_path).to eq('/users/1')
    expect(page).not_to have_content('Invalid email/password combination')
  end
end
