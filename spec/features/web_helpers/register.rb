# frozen_string_literal: true

def register
  visit '/users/new'
  attach_file 'user_profile_picture', 'spec/files/profile_pic.jpeg'
  fill_in 'user_firstname', with: 'John'
  fill_in 'user_lastname', with: 'Doe'
  fill_in 'user_email', with: 'john@example.com'
  fill_in 'user_password', with: 'test123'
  fill_in 'user_password_confirmation', with: 'test123'
  click_button 'Create account'
end

def register_second_user
  visit '/users/new'
  attach_file 'user_profile_picture', 'spec/files/3000.jpeg'
  fill_in 'user_firstname', with: 'James'
  fill_in 'user_lastname', with: 'Doe'
  fill_in 'user_email', with: 'james@example.com'
  fill_in 'user_password', with: 'test123'
  fill_in 'user_password_confirmation', with: 'test123'
  click_button 'Create account'
end

def register_without_picture
  visit '/users/new'
  fill_in 'user_firstname', with: 'John'
  fill_in 'user_lastname', with: 'Doe'
  fill_in 'user_email', with: 'john@example.com'
  fill_in 'user_password', with: 'test123'
  fill_in 'user_password_confirmation', with: 'test123'
  click_button 'Create account'
end
