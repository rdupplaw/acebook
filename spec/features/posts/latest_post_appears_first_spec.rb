# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Timeline', type: :feature do
  before do
    register
  end

  it 'Posts appear with the newest post first' do
    click_link 'New post'
    fill_in 'Message', with: 'Test Post 1'
    click_button 'Submit'
    click_link 'New post'
    fill_in 'Message', with: 'Test Post 2'
    click_button 'Submit'

    post1 = find('div', class: 'post', text: 'Test Post 1')
    post2 = find('div', class: 'post', text: 'Test Post 2')
    expect(post2).to appear_before(post1)
  end
end
