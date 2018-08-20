# frozen_string_literal: true

class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  before_save :downcase_email

  has_secure_password

  private

  def downcase_email
    self.email = email.downcase
  end
end
