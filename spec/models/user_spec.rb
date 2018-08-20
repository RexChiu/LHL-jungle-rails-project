# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do
    it 'should be created correctly' do
      @user = User.new(first_name: 'Cats', last_name: 'Cats', email: 'Cats@Cats.Cats', password: 'Cats', password_confirmation: 'Cats')
      expect(@user.valid?).to eq(true)
    end

    it 'should be invalid without a password' do
      @user = User.new(first_name: 'Cats', last_name: 'Cats', email: 'Cats@Cats.Cats', password_confirmation: 'Dogs')
      expect(@user.valid?).to eq(false)
    end

    it 'should be invalid without a password confirmation' do
      @user = User.new(first_name: 'Cats', last_name: 'Cats', email: 'Cats@Cats.Cats', password: 'Cats')
      expect(@user.valid?).to eq(false)
    end

    it 'should be invalid without matching passwords' do
      @user = User.new(first_name: 'Cats', last_name: 'Cats', email: 'Cats@Cats.Cats', password: 'Cats', password_confirmation: 'Dogs')
      expect(@user.valid?).to eq(false)
    end
  end
end
