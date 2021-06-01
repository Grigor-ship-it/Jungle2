require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js:true do
  before :each do
  
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "navigate to home page, click on a product to add to cart and see number for cart in Nav bar change" do
  visit root_path

  save_screenshot 'test_3_cart.png'

  details = page.find('.btn.btn-primary', match: :first)

  details.click

  save_screenshot 'test_3_cart2.png'

  expect(page).to have_text 'My Cart (1)'

  end
end
