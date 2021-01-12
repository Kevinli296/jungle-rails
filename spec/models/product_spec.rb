require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @category = Category.new({:name => 'Electronics'})
    @product = Product.new({:name => 'Samsung TV', :price_cents => 220000, :quantity => 4, :category_id => @category.id})
  end

  describe 'Validations' do
    it 'should save successfully when the product fields have a name, price, quantity and category.' do
      @product.save
      expect(@product).to be_present
    end
    # validation tests/examples here
    it 'should have a name' do
      @product.name = nil
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it 'should have a price' do
      @product.price_cents = nil
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it 'should have a quantity' do
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'should have a category' do
      @product.category = nil
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
