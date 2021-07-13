require 'rails_helper'

describe 'Groceries page' do
  describe 'navigation' do
    it 'can take the user to the HomePage' do 
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

      click_link('Go to HomePage')
      expect(current_path).to eq('/')
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
      visit "/groceries/#{grocery1.id}"
    
      click_link('Go to Grocery Stores')
      expect(current_path).to eq('/grocery_stores')
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
      visit "/groceries/#{grocery1.id}"
    
      click_link('Go to Groceries')
      expect(current_path).to eq('/groceries')
    end
  end

  describe 'features' do
    it 'can see all grocery names, prices, stock' do 
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

      expect(page).to have_content(grocery1.name)
      expect(page).to have_content("Price: #{grocery1.price}")
      expect(page).to have_content(grocery1.in_stock)
    end

    it 'shows link for updating groceries' do
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

      expect(page).to have_content("Update Grocery")
      click_link("Update Grocery")
      expect(current_path).to eq("/groceries/#{grocery1.id}/edit")
    end

    it 'can delete grocery' do
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
      grocery2 = store1.groceries.create!(
        name: 'Cheese Sticks', 
        price: 9.99, 
        in_stock: true
      )
      visit "/groceries/#{grocery1.id}"

      expect(page).to have_content("Delete Grocery")
      click_link("Delete Grocery")
      expect(current_path).to eq('/groceries')
      expect(page).to have_content(grocery2.name)
      expect(page).not_to have_content(grocery1.name)
    end
  end
end