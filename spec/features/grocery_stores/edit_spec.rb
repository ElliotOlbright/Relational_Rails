require 'rails_helper'

RSpec.describe 'Grocery Stores edit page' do
  describe 'navigation' do
    it 'can take the user to the HomePage' do 
      visit "/grocery_stores"

      click_link('Go to HomePage')
      expect(current_path).to eq('/')
    end

    it 'can take the user to the Groceries page' do 
      store1 = GroceryStore.create!(
        name: 'Albertsons', 
        address: '1234 Fake Street', 
        open_24_hours: false
      )
      visit "/grocery_stores/#{store1.id}"
    
      click_link('Go to Groceries')
      expect(current_path).to eq('/groceries')
    end

    it 'can take the user to the Grocery Store page' do 
      store1 = GroceryStore.create!(
        name: 'Albertsons', 
        address: '1234 Fake Street', 
        open_24_hours: false
      )

      store2 = GroceryStore.create!(
        name: 'Stater Bros', 
        address: '2345 Chump Boulevard', 
        open_24_hours: true
      )

      visit "/grocery_stores/#{store1.id}/groceries"
    
      click_link('Go to Grocery Stores')
      expect(current_path).to eq('/grocery_stores')
    end
  end
end