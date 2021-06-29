# frozen_string_literal: true

<<<<<<< HEAD
def register_and_login
=======
>>>>>>> b86e8e87d32bcae8a987b17f330a46ae5c39b343
  register

  visit login_path
  fill_in 'session[email]', with: 'john@example.com'
  fill_in 'session[password]', with: 'test123'
  click_button 'Log in'

  visit posts_path
end

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
