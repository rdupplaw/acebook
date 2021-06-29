# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Log in', type: :feature do
  before do
    register
  end

  it 'login fails when the user enters an incorrect email address' do
    visit login_path
    fill_in 'session[email]', with: 'use@example.com'
    fill_in 'session[password]', with: 'foobar'
    click_button 'Log in'
    expect(page).to have_current_path('/login')
    expect(page).to have_content('Invalid email/password combination')
  end

  it 'login fails when the user enters an incorrect password' do
    visit login_path
    fill_in 'session[email]', with: 'user@example.com'
    fill_in 'session[password]', with: 'foobarr'
    click_button 'Log in'
    expect(page).to have_current_path('/login')
    expect(page).to have_content('Invalid email/password combination')
  end

  it 'login fails when the user enters an incorrect email address and password' do
    visit login_path
    fill_in 'session[email]', with: 'use@example.com'
    fill_in 'session[password]', with: 'foobarr'
    click_button 'Log in'
    expect(page).to have_current_path('/login')
    expect(page).to have_content('Invalid email/password combination')
  end

  it 'login succeeds when the user enters correct email address and password' do
    visit login_path
    fill_in 'session[email]', with: 'john@example.com'
    fill_in 'session[password]', with: 'test123'
    click_button 'Log in'
    expect(current_path).to eq('/posts')
    expect(page).not_to have_content('Invalid email/password combination')
  end
end
