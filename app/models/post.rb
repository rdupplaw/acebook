# frozen_string_literal: true

class Post < ApplicationRecord
  has_one_attached :image
  has_many :comments
  has_many :likes, dependent: :destroy

  belongs_to :user
end
