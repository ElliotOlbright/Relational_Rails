require 'rails_helper'

describe 'Grocery Store Groceries page' do 
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
  end

  describe 'navigation' do
    it 'can take the user to the HomePage' do 
      visit "/grocery_stores/#{@store1.id}/groceries"

      click_link('Go to HomePage')
      expect(current_path).to eq('/')
    end

    it 'can take the user to the Grocery Store page' do 
      visit "/grocery_stores/#{@store1.id}/groceries"
    
      click_link('Go to Grocery Stores')
      expect(current_path).to eq('/grocery_stores')
    end  

    it 'can take the user to the Groceries page' do 
      visit "/grocery_stores/#{@store1.id}/groceries"
    
      click_link('Go to Groceries')
      expect(current_path).to eq('/groceries')
    end
  end

  describe 'features' do
    it 'can see all grocery info from that store' do 
      grocery2 = @store1.groceries.create!(
        name: 'Cheese Sticks', 
        price: 9.99, 
        in_stock: false
      )
      visit "/grocery_stores/#{@store1.id}/groceries"

      expect(page).to have_content(@grocery1.name)
      expect(page).to have_content("Price: #{@grocery1.price}")
      expect(page).to have_content(@grocery1.in_stock)
      expect(page).to have_content(grocery2.name)
      expect(page).to have_content("Price: #{grocery2.price}")
      expect(page).to have_content(grocery2.in_stock)
    end

    it 'can use link to create grocery' do
      visit "grocery_stores/#{@store1.id}"

      click_link("Go to this store's groceries")
      expect(page).to have_content('Create Grocery')
      click_link('Create Grocery')
      expect(page).to have_content('Grocery name:')
      expect(page).to have_content('Grocery price:')
      expect(page).to have_content('In stock?:')
    end

    it 'shows link for updating groceries' do
      visit "/grocery_stores/#{@store1.id}/groceries"

      expect(page).to have_content("Update Grocery")
    end

    it 'can delete grocery' do
      visit "/grocery_stores/#{@store1.id}/groceries"

      expect(page).to have_content(@grocery1.name)
      expect(page).to have_content("Delete Grocery")
      click_link("Delete Grocery")
      expect(current_path).to eq('/groceries')
      expect(page).not_to have_content(@grocery1.name)
    end

    it 'can sort groceries alphabetically' do
      grocery2 = @store1.groceries.create!(
        name: 'Almond Slams', 
        price: 7.99, 
        in_stock: true
      )
      grocery3 = @store1.groceries.create!(
        name: 'Devil Rolls', 
        price: 7.99, 
        in_stock: true
      )
      visit "/grocery_stores/#{@store1.id}/groceries"

      within("#store_groceries") do
        expect(all("#name")[0].text).to eq("#{@grocery1.name}")
        expect(all("#name")[1].text).to eq("#{grocery2.name}")
        expect(all("#name")[2].text).to eq("#{grocery3.name}")
      end
      
      click_link 'Alphabetically'
      within("#store_groceries") do
        expect(all("#name")[0].text).to eq("#{grocery2.name}")
        expect(all("#name")[1].text).to eq("#{grocery3.name}")
        expect(all("#name")[2].text).to eq("#{@grocery1.name}")
      end
    end

    it 'can filter price by given value in search field' do
      grocery2 = @store1.groceries.create!(
        name: 'Almond Slams', 
        price: 8.99, 
        in_stock: true
      )
      grocery3 = @store1.groceries.create!(
        name: 'Devil Rolls', 
        price: 9.99, 
        in_stock: true
      )
      visit "/grocery_stores/#{@store1.id}/groceries"

      fill_in :price, with: '8.00'
      click_button('Submit')
      expect(page).not_to have_content(@grocery1.name)
      expect(page).to have_content(grocery2.name)
      expect(page).to have_content(grocery3.name)
    end
  end
end