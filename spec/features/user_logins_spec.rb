# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'UserLogins', type: :feature, js: true do
  before :each do
    @user = User.create!(
      first_name: 'Cats',
      last_name: 'Cats',
      email: 'cats@cats.cats',
      password: 'Cats',
      password_confirmation: 'Cats'
    )
  end

  scenario 'They can login with valid credentials' do
    # ACT
    visit root_path

    click_on 'Login'

    expect(find('h1', text: 'Login')).not_to eq(nil)

    fill_in 'email', with: 'cats@cats.cats'
    fill_in 'password', with: 'Cats'
    click_on 'Submit'

    expect(page).to have_content("Signed in as Cats")

    # DEBUG / VERIFY
    save_screenshot
  end
end
