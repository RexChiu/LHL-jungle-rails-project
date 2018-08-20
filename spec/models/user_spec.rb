# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do
    it 'should be created correctly' do
      @user = User.new(first_name: 'Cats', last_name: 'Cats', email: 'Cats@Cats.Cats', password: 'Cats', password_confirmation: 'Cats')
      expect(@user.valid?).to eq(true)
    end

    it 'should be invalid without a first name' do
      @user = User.new(last_name: 'Cats', email: 'Cats@Cats.Cats', password: 'Cats', password_confirmation: 'Cats')
      expect(@user.valid?).to eq(false)
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'should be invalid without a last name' do
      @user = User.new(first_name: 'Cats', email: 'Cats@Cats.Cats', password: 'Cats', password_confirmation: 'Cats')
      expect(@user.valid?).to eq(false)
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'should be invalid without an email' do
      @user = User.new(first_name: 'Cats', last_name: 'Cats', password: 'Cats', password_confirmation: 'Cats')
      expect(@user.valid?).to eq(false)
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should be invalid without a password' do
      @user = User.new(first_name: 'Cats', last_name: 'Cats', email: 'Cats@Cats.Cats', password_confirmation: 'Dogs')
      expect(@user.valid?).to eq(false)
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'should be invalid without a password confirmation' do
      @user = User.new(first_name: 'Cats', last_name: 'Cats', email: 'Cats@Cats.Cats', password: 'Cats')
      expect(@user.valid?).to eq(false)
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'should be invalid without matching passwords' do
      @user = User.new(first_name: 'Cats', last_name: 'Cats', email: 'Cats@Cats.Cats', password: 'Cats', password_confirmation: 'Dogs')
      expect(@user.valid?).to eq(false)
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should not allow repeated emails' do
      @user = User.create(first_name: 'Cats', last_name: 'Cats', email: 'Cats@Cats.Cats', password: 'Cats', password_confirmation: 'Cats')
      @user1 = User.new(first_name: 'Cats', last_name: 'Cats', email: 'Cats@Cats.cats', password: 'Cats', password_confirmation: 'Cats')
      expect(@user1.valid?).to eq(false)
      expect(@user1.errors.full_messages).to include('Email has already been taken')
      @user.destroy
    end

    it 'should not allow password lengths under 3' do
      @user = User.new(first_name: 'Cats', last_name: 'Cats', email: 'Cats@Cats.Cats', password: 'C', password_confirmation: 'C')
      expect(@user.valid?).to eq(false)
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 3 characters)')
    end
  end

  context '.authenticate_with_credentials' do
    before :each do
      @user = User.create(first_name: 'Cats', last_name: 'Cats', email: 'Cats@Cats.Cats', password: 'Cats', password_confirmation: 'Cats')
    end

    after :each do
      @user.destroy
    end

    it 'should login with correct email and password' do
      login = User.authenticate_with_credentials(@user.email, @user.password)
      expect(login).to eq(@user)
    end

    it 'should not login with incorrect email' do
      login = User.authenticate_with_credentials('invalid_email', @user.password)
      expect(login).to eq(nil)
    end

    it 'should not login with incorrect password' do
      login = User.authenticate_with_credentials(@user.email, 'invalid_password')
      expect(login).to eq(nil)
    end
  end

  context 'edge cases' do
    before :each do
      @user = User.create(first_name: 'Cats', last_name: 'Cats', email: 'Cats@Cats.Cats', password: 'Cats', password_confirmation: 'Cats')
    end

    after :each do
      @user.destroy
    end

    it 'should login with extra whitespace email and password' do
      login = User.authenticate_with_credentials('      Cats@Cats.Cats        ', @user.password)
      expect(login).to eq(@user)
    end

    it 'should login with correct case insensitive email and password' do
      login = User.authenticate_with_credentials('cats@cats.cats', @user.password)
      expect(login).to eq(@user)
    end
  end
end
