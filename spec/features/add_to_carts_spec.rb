require 'rails_helper'

RSpec.feature "Visitor navigates to product page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  'Test',
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see the product" do
    # ACT
    visit root_path
    page.find('.product').find_link('Add').click
    expect(page).to have_text 'My Cart (1)', count: 1

    # # DEBUG
    expect(page).to have_css 'article.product'

    # VERIFY
    save_screenshot

  end
end