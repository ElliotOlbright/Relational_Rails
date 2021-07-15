require 'rails_helper'

describe 'Grocery Stores index page' do
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
    @store3 = GroceryStore.create!(
      name: 'CVS', 
      address: '4567 Woke Place', 
      open_24_hours: true,
      departments: 4
    )
  end

  describe 'navigation' do
    it 'can take the user to the HomePage' do 
      visit "/grocery_stores"

      click_link('Go to HomePage')
      expect(current_path).to eq('/')
    end

    it 'can take the user to the Groceries page' do 
      visit "/grocery_stores"
    
      click_link('Go to Groceries')
      expect(current_path).to eq('/groceries')
    end
  end

  describe 'features' do
    it 'can see all store names' do 
      visit '/grocery_stores'

      expect(page).to have_content(@store1.name)
      expect(page).to have_content(@store2.name)
      expect(page).to have_content(@store3.name)
    end

    it 'can dislpay stores from newest to oldest' do 
      visit "/grocery_stores"

      within("#grocery_stores") do 
        expect(all("#address")[0].text).to eq("Address: #{@store3.address}")
        expect(all("#address")[1].text).to eq("Address: #{@store2.address}")
        expect(all("#address")[2].text).to eq("Address: #{@store1.address}")
      end 
    end

    it 'can take the user to create a new store' do 
      visit '/grocery_stores'
      expect(current_path).to eq('/grocery_stores')

      click_link('New Grocery Store')
      expect(current_path).to eq('/grocery_stores/new')
    end

    it 'can see link to edit store' do
      visit '/grocery_stores'

      expect(page).to have_content('Update Store')
    end

    it 'can delete store' do
      visit "/grocery_stores/#{@store1.id}"

      expect(page).to have_content("Delete Store")
      click_link("Delete Store")
      expect(current_path).to eq('/grocery_stores')
      expect(page).to have_content(@store2.name)
      expect(page).to_not have_content(@store1.name)
    end

    it 'shows case-insensitive exact or partial search matches' do
      visit '/grocery_stores'
      fill_in :name, with: 'albert'
      click_button('Search')
      expect(page).to have_content('Albertsons')
      expect(page).to_not have_content('Stater Bros')
      
      visit '/grocery_stores'
      fill_in :name, with: 'Albertsons'
      click_button('Search')
      expect(page).to have_content('Albertsons')
      expect(page).to_not have_content('State Bros')
    end

    it 'sorts page by number of children descending' do
      @store1.groceries.create!(
        name: 'Fishy Bits', price: 7.99, in_stock: true
      )
      @store1.groceries.create!(
        name: 'Cheese Sticks', price: 9.99, in_stock: true
      )
      @store1.groceries.create!(
        name: 'Chicky Tendies', price: 12.99, in_stock: true
      )
      @store2.groceries.create!(
        name: 'Tofu', price: 9.45, in_stock: false
      )
      visit '/grocery_stores'

      # Default order: 'created_at' descending
      within('#grocery_stores') do
        expect(all("#name")[0].text).to eq("#{@store3.name} (0 groceries!)")
        expect(all("#name")[1].text).to eq("#{@store2.name} (1 groceries!)")
        expect(all("#name")[2].text).to eq("#{@store1.name} (3 groceries!)")
      end
      
      click_link '# of Groceries'
      expect(current_path).to eq('/grocery_stores')
      within('#grocery_stores') do
        expect(all("#name")[0].text).to eq("#{@store1.name} (3 groceries!)")
        expect(all("#name")[1].text).to eq("#{@store2.name} (1 groceries!)")
        expect(all("#name")[2].text).to eq("#{@store3.name} (0 groceries!)")
      end
    end
  end
end