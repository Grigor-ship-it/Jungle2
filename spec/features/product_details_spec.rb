require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js:true do
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

  scenario "navigate to home page, click on product detail page by clicking on a product" do

    # @category.products.create!(
    #   name:  Faker::Hipster.sentence(3),
    #   description: Faker::Hipster.paragraph(4),
    #   image: open_asset('apparel1.jpg'),
    #   quantity: 10,
    #   price: 64.99
    # )
 
    visit root_path


    save_screenshot 'Click_test_image2.png'
    

    details = page.find('h4', match: :first)

    details.click


  

    save_screenshot 'Click_test_image.png'

    expect(page).to have_text 'Apparel'
    
  end
end
