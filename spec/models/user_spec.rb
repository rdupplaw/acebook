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

  context 'when not given a lastname' do
    it 'is invalid' do
      @user.lastname = ''
      expect(@user).not_to be_valid
    end
  end

  context 'when not given an email' do
    it 'is invalid' do
      @user.email = ''
      expect(@user).not_to be_valid
    end
  end

  context 'when given a first name greater than 50 chars' do
    it 'it is invalid' do
      @user.firstname = "a" * 51
      expect(@user).not_to be_valid
    end
  end

  context 'when given a last name greater than 50 chars' do
    it 'it is invalid' do
      @user.lastname = "a" * 51
      expect(@user).not_to be_valid
    end
  end

  context 'when given a email greater than 255 chars' do
    it 'it is invalid' do
      @user.email = "a" * 244 + "@example.com"
      expect(@user).not_to be_valid
    end
  end

  

end
