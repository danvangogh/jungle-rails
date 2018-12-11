require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

  before :each do

    @category = Category.new(
      name: 'category'
    )

    @product = Product.new(
      name: 'item',
      price: 1,
      quantity: 1,
      category: @category
    )
  end

    it "is valid with valid attributes" do
      expect(@product).to be_valid
    end

    it 'is not valid without a name' do
      expect(@product.name).to_not be_nil
    end

    it 'is not valid without a price' do
      expect(@product.price).to_not be_nil
    end

    it 'is not valid without a category' do
      expect(@product.category).to_not be_nil
    end

    it 'is not valid without quantity' do
      expect(@product.quantity).to_not be_nil
    end

  end
end
