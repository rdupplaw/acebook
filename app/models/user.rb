class User < ApplicationRecord
  attr_accessor :email, :password, :firstname, :lastname

  def initialize(attributes = {})
    @email = attributes[:email]
    @password = attributes[:password]
    @firstname = attributes[:firstname]
    @lastname = attributes[:lastname]
  end

end
