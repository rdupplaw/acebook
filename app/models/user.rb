class User < ApplicationRecord
  validates :firstname, presence: true
end
