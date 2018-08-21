# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Add To Cart', type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end

  scenario 'They can add a product to cart' do
    # ACT
    visit root_path

    click_link 'Add'

    expect(find('a', text: 'My Cart (1)')).not_to eq(nil)

    # DEBUG / VERIFY
    save_screenshot
  end
end
