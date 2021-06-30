require 'rails_helper'

RSpec.describe 'Post profile link', type: :feature do
  it 'Posts have a link to the poster\'s profile' do
    register
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'John Doe'

    expect(current_path).to eq('/users/1')
  end
end