# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = described_class.new(firstname: 'Example', lastname: 'User', email: 'user@example.com',
                                password: 'foobar', password_confirmation: 'foobar')
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
    it 'is invalid' do
      @user.firstname = 'a' * 51
      expect(@user).not_to be_valid
    end
  end

  context 'when given a last name greater than 50 chars' do
    it 'is invalid' do
      @user.lastname = 'a' * 51
      expect(@user).not_to be_valid
    end
  end

  context 'when given a email greater than 255 chars' do
    it 'is invalid' do
      @user.email = "#{'a' * 244}@example.com"
      expect(@user).not_to be_valid
    end
  end

  context 'when given a valid email address' do
    it 'is valid' do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |address|
        @user.email = address
        expect(@user).to be_valid, "#{address.inspect} should be valid"
      end
    end
  end

  context 'when given an invalid email address' do
    it 'is invalid' do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com
                             foo@bar..com]
      invalid_addresses.each do |address|
        @user.email = address
        expect(@user).not_to be_valid, "#{address.inspect} should be invalid"
      end
    end
  end

  context 'when given a duplicate email address' do
    it 'is invalid' do
      user_duplicate = @user.dup
      @user.save
      expect(user_duplicate).not_to be_valid
    end
  end

  it 'email addresses should be saved as lower-case' do
    mixed_case_email = 'Foo@ExAMPle.CoM'
    @user.email = mixed_case_email
    @user.save
    expect(mixed_case_email.downcase).to eq(@user.reload.email)
  end
end
