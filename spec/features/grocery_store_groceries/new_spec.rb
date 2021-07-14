require 'rails_helper'

RSpec.describe 'Create New Grocery page' do
  before :each do
    @store1 = GroceryStore.create!(
      name: 'Albertsons', 
      address: '1234 Fake Street', 
      open_24_hours: false,
      departments: 5
    )
  end

  describe 'navigation' do
    it 'can take the user to the HomePage' do 
      visit "/grocery_stores/#{@store1.id}/groceries/new"

      click_link('Go to HomePage')
      expect(current_path).to eq('/')
    end

    it 'can take the user to the Grocery Store page' do 
      visit "/grocery_stores/#{@store1.id}/groceries/new"
    
      click_link('Go to Grocery Stores')
      expect(current_path).to eq('/grocery_stores')
    end

    it 'can take the user to the Groceries page' do 
      visit "/grocery_stores/#{@store1.id}/groceries/new"
    
      click_link('Go to Groceries')
      expect(current_path).to eq('/groceries')
    end
  end
  
  describe 'features' do
    it 'lists fields' do
      visit "/grocery_stores/#{@store1.id}/groceries/new"

      expect(page).to have_content('Grocery name:')
      expect(page).to have_content('Grocery price:')
      expect(page).to have_content('In stock?:')
    end

    it 'creates new grocery with given attributes' do
      visit "/grocery_stores/#{@store1.id}/groceries/new"

      fill_in :name, with: "Example Name"
      fill_in :price, with: "1.05"
      fill_in :in_stock, with: "true"
      click_button('Create Grocery')

      expect(current_path).to eq("/grocery_stores/#{@store1.id}/groceries")
      expect(page).to have_content("Example Name")
      expect(page).to have_content("1.05")
      expect(page).to have_content("true")
    end
  end
end