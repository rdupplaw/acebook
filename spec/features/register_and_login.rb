def register_and_login
  user = User.new(firstname: 'TestUser', lastname: 'User', email: 'user@example.com',
    password: 'foobar', password_confirmation: 'foobar')
  user.save

  visit login_path
  fill_in 'session[email]', with: 'user@example.com'
  fill_in 'session[password]', with: 'foobar'
  click_button 'Log in'

  visit posts_path
end 