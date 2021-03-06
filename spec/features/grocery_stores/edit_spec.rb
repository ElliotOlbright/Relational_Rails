require 'rails_helper'

RSpec.describe 'Grocery Stores edit page' do
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
      visit "/grocery_stores/#{@store1.id}/edit"

      click_link('Go to HomePage')
      expect(current_path).to eq('/')
    end

    it 'can take the user to the Groceries page' do 
      visit "/grocery_stores/#{@store1.id}/edit"
    
      click_link('Go to Groceries')
      expect(current_path).to eq('/groceries')
    end

    it 'can take the user to the Grocery Store page' do 
      visit "/grocery_stores/#{@store1.id}/edit"
    
      click_link('Go to Grocery Stores')
      expect(current_path).to eq('/grocery_stores')
    end
  end

  describe 'features' do
    it 'can update store' do
      visit "grocery_stores/#{@store1.id}"
      
      click_link('Update Store')
      expect(current_path).to eq("/grocery_stores/#{@store1.id}/edit")
      fill_in :name, with: "Example Name"
      fill_in :address, with: "Example Address"
      fill_in :open_24_hours, with: "true"
      click_button('Update Store')

      expect(current_path).to eq("/grocery_stores/#{@store1.id}")
      expect(page).to have_content("Example Name")
      expect(page).to have_content("Example Address")
    end

    it 'leaves attributes alone if field is blank' do
      visit "/grocery_stores/#{@store1.id}/edit"
      fill_in :name, with: ""
      fill_in :address, with: ""
      fill_in :open_24_hours, with: ""
      click_button('Update Store')

      expect(current_path).to eq("/grocery_stores/#{@store1.id}")
      expect(page).to have_content("Albertsons")
      expect(page).to have_content("1234 Fake Street")
      expect(page).to have_content("false")
    end
  end
end