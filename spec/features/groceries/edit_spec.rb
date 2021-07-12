require 'rails_helper'

RSpec.describe 'grocery edit page' do
  describe 'navigation' do
    it 'can take the user to the HomePage' do 
      visit "/groceries"
      click_link('Go to HomePage')
      expect(current_path).to eq('/')
    end

    it 'can take the user to the Groceries page' do 
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
      visit "/groceries/#{grocery1.id}/edit"
    
      click_link('Go to Groceries')
      expect(current_path).to eq('/groceries')
    end

    it 'can take the user to the Grocery Store page' do 
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
      visit "/groceries/#{grocery1.id}/edit"
    
      click_link('Go to Grocery Stores')
      expect(current_path).to eq('/grocery_stores')
    end
  end

  describe 'features' do
    it 'shows Update Grocery form' do 
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
      visit "/groceries/#{grocery1.id}"
      click_link('Update Grocery')

      expect(page).to have_field(:name)
      expect(page).to have_field(:price)
    end 

    it 'can update grocery' do 
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
      visit "/groceries/#{grocery1.id}/edit"
      fill_in :name, with: "Example Name"
      fill_in :price, with: "1.05"
      fill_in :in_stock, with: "true"
      click_button('Update Grocery')

      expect(current_path).to eq("/groceries/#{grocery1.id}")
      expect(page).to have_content('Example Name')
      expect(page).to have_content('1.05')
      expect(page).to have_content('true')
    end
  end
end