# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'ProductDetails', type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |_n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario 'They can click on a product' do
    # ACT
    visit root_path

    puts @category.products.last.name
    click_on @category.products.last.name

    expect(find('.products-show')).not_to eq(nil)

    # DEBUG / VERIFY
    save_screenshot
  end
end
