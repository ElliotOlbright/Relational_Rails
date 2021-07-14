require 'rails_helper'

describe 'Groceries index page' do 
  before :each do
    @store1 = GroceryStore.create!(
      name: 'Albertsons', 
      address: '1234 Fake Street', 
      open_24_hours: false,
      departments: 5
    )
    @grocery1 = @store1.groceries.create!(
      name: 'Fishy Bits', 
      price: 7.99, 
      in_stock: true
    )
    @grocery2 = @store1.groceries.create!(
      name: 'Cheese Sticks', 
      price: 9.99, 
      in_stock: true
    )
    end

  describe 'navigation' do
    it 'can take the user to the HomePage' do 
      visit '/groceries'

      click_link('Go to HomePage')
      expect(current_path).to eq('/')
    end 

    it 'can take the user to the Grocery Store page' do 
      visit '/groceries'
    
      click_link('Go to Grocery Stores')
      expect(current_path).to eq('/grocery_stores')
    end
  end

  describe 'features' do
    it 'can see all grocery names, prices, stock' do 
      visit '/groceries'

      expect(page).to have_content(@grocery1.name)
      expect(page).to have_content("Price: #{@grocery1.price}")
      expect(page).to have_content(@grocery1.in_stock)
      expect(page).to have_content(@grocery2.name)
      expect(page).to have_content("Price: #{@grocery2.price}")
      expect(page).to have_content(@grocery2.in_stock)
    end
    
    it 'shows link for updating groceries' do
      visit "/groceries"

      expect(page).to have_content("Update Grocery")
    end

    it 'can delete grocery' do
      visit "/groceries/#{@grocery1.id}"

      expect(page).to have_content("Delete Grocery")
      click_link("Delete Grocery")
      expect(current_path).to eq('/groceries')
      expect(page).to have_content(@grocery2.name)
      expect(page).not_to have_content(@grocery1.name)
    end

    it 'only shows true records' do
      grocery = @store1.groceries.create!(
        name: 'Real Fake Meat', 
        price: 10.50, 
        in_stock: false
      )
      visit '/groceries'

      expect(page).to have_content("Fishy Bits")
      expect(page).to have_content("Cheese Sticks")
      expect(page).not_to have_content("Real Fake Meat")
    end

    it 'shows case-insensitive exact or partial search matches' do
      visit '/groceries'
      fill_in :name, with: 'fish'
      click_button('Search')
      expect(page).to have_content('Fishy Bits')
      expect(page).to_not have_content('Cheese Sticks')

      visit '/groceries'
      fill_in :name, with: 'Fishy Bits'
      click_button('Search')
      expect(page).to have_content('Fishy Bits')
      expect(page).to_not have_content('Cheese Sticks')
    end
  end
end