require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    category1 = Category.create({name: "Electronics"})
    it "returns false if name is not present" do     
      product = category1.products.create({name: " ",price: 333, quantity: 4})     
      expect(product).to_not be_valid
      puts product.errors.full_messages
    end
    it "returns true if name is present" do     
      product = category1.products.create({name: "burner",price: 333, quantity: 4})    
      expect(product).to be_valid
    end
    it "returns false if price is not present" do     
      product = category1.products.create({name: "burner",price: nil, quantity: 4})     
      expect(product).to_not be_valid
      puts product.errors.full_messages
    end
    it "returns false if quantity is not present" do     
      product = category1.products.create({name: "burner",price: 333, quantity: nil})     
      expect(product).to_not be_valid
      puts product.errors.full_messages
    end
    it "returns false if category is not present" do     
      product = Product.create({name: "burner",price: 333, quantity: 4, category: nil})     
      expect(product).to_not be_valid
      puts product.errors.full_messages
    end
  end
end
