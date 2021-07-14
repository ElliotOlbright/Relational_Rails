require 'rails_helper'

describe 'Grocery Store creation page' do 
  describe 'navigation' do
    it 'can take the user to the HomePage' do 
      visit '/grocery_stores/new'

      click_link('Go to HomePage')
      expect(current_path).to eq('/')
    end 

    it 'can take the user to the Grocery Store page' do 
      visit '/grocery_stores/new'
    
      click_link('Go to Grocery Stores')
      expect(current_path).to eq('/grocery_stores')
    end 

    it 'can take the user to the Groceries page' do 
      visit '/grocery_stores/new'
    
      click_link('Go to Groceries')
      expect(current_path).to eq('/groceries')
    end
  end

  describe 'features' do
    it 'shows New Grocery Store Form' do 
      visit "/grocery_stores/new"

      expect(page).to have_field(:name)
      expect(page).to have_field(:address)
      expect(page).to have_field(:open_24_hours)
    end 

    it 'can create a new store' do 
      store1 = GroceryStore.create!(
        name: 'Albertsons', 
        address: '1234 Fake Street', 
        open_24_hours: false,
      departments: 5
      )
      visit "/grocery_stores/new"

      store2 = GroceryStore.create!(
        name: 'Stater Bros', 
        address: '2345 Chump Boulevard', 
        open_24_hours: true,
      departments: 6
      )
      click_button('Create Store')

      expect(current_path).to eq('/grocery_stores')
      expect(page).to have_content('Grocery Stores Index')
      expect(page).to have_content('Stater Bros')
    end
  end
end 
