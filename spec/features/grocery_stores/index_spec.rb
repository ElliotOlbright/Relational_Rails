require 'rails_helper'

describe 'Grocery Stores index page' do 
  it 'can see all store names' do 
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
    
    visit '/grocery_stores'

    expect(page).to have_content(store1.name)
    expect(page).to have_content(store2.name)
  end 

  it 'can take the user to the HomePage' do 
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

    grocery1 = store1.groceries.create!(
      name: 'Fishy Bits', 
      price: 7.99, 
      in_stock: true
    )

    visit "/grocery_stores"
  
    click_link('Go to Groceries')
    expect(current_path).to eq('/groceries')
  end

  it 'can dislpay stores from newest to oldest' do 
    @store1 = GroceryStore.create!(
      name: 'Food 4 Less', 
      address: '6789 Cow Circle', 
      open_24_hours: true
    )

    @store2 = GroceryStore.create!(
      name: 'Rite Aid', 
      address: '5678 Banana Avenue', 
      open_24_hours: false
    )
    
    @store3 = GroceryStore.create!(
      name: 'CVS', 
      address: '4567 Woke Place', 
      open_24_hours: true
    )

    visit "/grocery_stores"

    within("#grocery_stores") do 
      expect(all("#address")[0].text).to eq("Address: #{@store3.address}")
      expect(all("#address")[1].text).to eq("Address: #{@store2.address}")
      expect(all("#address")[2].text).to eq("Address: #{@store1.address}")
    end 
  end
end