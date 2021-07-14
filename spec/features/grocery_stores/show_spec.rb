require 'rails_helper'

describe 'Grocery Stores page' do 
  before :each do
    @store1 = GroceryStore.create!(
      name: 'Albertsons', 
      address: '1234 Fake Street', 
      open_24_hours: false,
      departments: 5
    )
    @store2 = GroceryStore.create!(
      name: 'Stater Bros', 
      address: '2345 Chump Boulevard', 
      open_24_hours: true,
      departments: 6
    )
  end

  describe 'navigation' do
    it 'can take the user to the HomePage' do
      visit "/grocery_stores/#{@store1.id}"

      click_link('Go to HomePage')
      expect(current_path).to eq('/')
    end

    it 'can take the user to the Grocery Store page' do 
      visit "/grocery_stores/#{@store1.id}"
    
      click_link('Go to Grocery Stores')
      expect(current_path).to eq('/grocery_stores')
    end

    it 'can take the user to the Groceries page' do 
      visit "/grocery_stores/#{@store1.id}"

      click_link('Go to Groceries')
      expect(current_path).to eq('/groceries')
    end
  end

  describe 'features' do
    it 'can see all name and address of all stores' do 
      visit "/grocery_stores"

      expect(page).to have_content(@store1.name)
      expect(page).to have_content("Address: #{@store1.address}")
      expect(page).to have_content(@store2.name)
      expect(page).to have_content("Address: #{@store2.address}")
    end

    it 'shows groceries at store' do 
      grocery1 = @store1.groceries.create!(
        name: 'Fishy Bits', 
        price: 7.99,
        in_stock: true
      )
      visit "/grocery_stores/#{@store1.id}"

      expect(page).to have_content("This store has 1 groceries")
    end 

    it 'can take the user to the inventory page' do 
      visit "/grocery_stores/#{@store1.id}"

      click_link("Go to this store's groceries")
      expect(current_path).to eq("/grocery_stores/#{@store1.id}/groceries")
    end

    it 'can take user to edit page' do
      visit "grocery_stores/#{@store1.id}"
      click_link('Update Store')

      expect(current_path).to eq("/grocery_stores/#{@store1.id}/edit")
      expect(page).to have_content('Update Grocery Store')
    end

    it 'can delete store' do
      visit "/grocery_stores/#{@store1.id}"

      expect(page).to have_content("Delete Store")
      click_link("Delete Store")
      expect(current_path).to eq('/grocery_stores')
      expect(page).to have_content(@store2.name)
      expect(page).not_to have_content(@store1.name)
    end
  end
end 