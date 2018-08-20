# frozen_string_literal: true

class User < ActiveRecord::Base
  validates :password, presence: true
  validates :password_confirmation, presence: true

  has_secure_password
end
