require 'rails_helper'

RSpec.describe GroceryStore do
  it {should have_many :groceries}

  describe 'instance methods' do
    it 'counts number of own groceries' do
      store1 = GroceryStore.create!(
        name: 'Albertsons', 
        address: '1234 Fake Street', 
        open_24_hours: false
      )
      grocery1 = store1.groceries.create!(
        name: 'Fishy Bits', 
        price: 7.99, 
        in_stock: true
      )

      expect(store1.grocery_count).to eq(1)
    end
  end
end