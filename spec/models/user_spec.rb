require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(firstname: 'Example', lastname: 'User', email: 'user@example.com')
  end

  context 'when given all required attributes' do
    it 'is valid' do
      expect(@user).to be_valid
    end
  end

  context 'when not given a firstname' do
    it 'is invalid' do
      @user.firstname = ''
      expect(@user).not_to be_valid
    end
  end
end
