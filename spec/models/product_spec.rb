# require 'rails_helper'

# RSpec.describe Product, type: :model do
#   describe 'Validations' do

#     let(:socks) { Product.new(name: "Socks", price: 10, quantity: 7, category_id: 1) }
#     let(:jacket) { Product.new(name: "Jacket", price: 80, quantity: 4, category_id: 1) }
#     let(:hoodie) { Product.new(name: "Hoodie", price: 50, quantity: 12, category_id: 1) }
#     let(:jeans) { Product.new(name: "Jeans", price: 40, quantity: 15, category_id: 1) }
#     let(:underwear) { Product.new(name: "Underwear", price: 5, quantity: 10, category_id: 1) }

#     it 'should have all required fields' do
#       socks.save
#       expect(socks.name).to be_present
#       expect(jacket.price).to be_present
#       expect(hoodie.quantity).to be_present
#       expect(jeans.category_id).to be_present
#     end

#     it 'should have a name' do
#       category = Category.create(id: 1, name: 'Apperal')
#       socks.update(category_id: category.id)
#       socks.name = nil
#       socks.save
#       expect(socks.errors.size).to eql(1)
#     end

#     it 'should have a price' do
#       category = Category.create(id: 1, name: 'Apperal')
#       jacket.update(category_id: category.id)
#       jacket.price_cents = nil
#       jacket.save
#       expect(jacket.errors.size).to eql(3)
#     end

#     it 'should have a quantity count' do
#       category = Category.create(id: 1, name: 'Apperal')
#       hoodie.update(category_id: category.id)
#       hoodie.quantity = nil
#       hoodie.save
#       expect(hoodie.errors.size).to eql(1)
#     end

#     it 'should have a category' do
#       category = Category.create(id: 1, name: 'Apperal')
#       jeans.update(category_id: category.id)
#       jeans.category_id = nil
#       jeans.save
#       expect(jeans.errors.size).to eql(1)
#     end


#   end
# end
