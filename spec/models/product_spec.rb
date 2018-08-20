# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'Validations' do
    before :each do
      @category = Category.new(name: 'test_category')
    end

    after :each do
      @product.destroy
    end

    it 'should be created correctly' do
      expect(Product.count).to eq(0)
      @product = Product.create(name: 'test_product', description: 'testing', image: 'test_url', price_cents: 1000, quantity: 10, category: @category)
      expect(Product.count).to eq(1)
    end

    it 'should be invalid without a name' do
      expect(Product.count).to eq(0)
      @product = Product.create(description: 'testing', image: 'test_url', price_cents: 1000, quantity: 10, category: @category)
      expect(@product.valid?).to eq(false)
      expect(@product.errors.full_messages).to eq(["Name can't be blank"])
      expect(Product.count).to eq(0)
    end

    it 'should be invalid without a price' do
      expect(Product.count).to eq(0)
      @product = Product.create(name: 'test_product', description: 'testing', image: 'test_url', quantity: 10, category: @category)
      expect(@product.valid?).to eq(false)
      expect(@product.errors.full_messages).to eq(['Price cents is not a number', 'Price is not a number', "Price can't be blank"])
      expect(Product.count).to eq(0)
    end

    it 'should be invalid without a quantity' do
      expect(Product.count).to eq(0)
      @product = Product.new(name: 'test_product', description: 'testing', image: 'test_url', price_cents: 1000, category: @category)
      expect(@product.valid?).to eq(false)
      expect(@product.errors.full_messages).to eq(["Quantity can't be blank"])
      expect(Product.count).to eq(0)
    end

    it 'should be invalid without a category' do
      expect(Product.count).to eq(0)
      @product = Product.new(name: 'test_product', description: 'testing', image: 'test_url', price_cents: 1000, quantity: 10)
      expect(@product.valid?).to eq(false)
      expect(@product.errors.full_messages).to eq(["Category can't be blank"])
      expect(Product.count).to eq(0)
    end
  end
end
