require 'rails_helper'

describe 'Grocery Store Groceries page' do 
  it 'can see all grocery info from that store' do 
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
      in_stock: false
    )
    
    visit "/grocery_stores/#{store1.id}/groceries"
    
    expect(page).to have_content(grocery1.name)
    expect(page).to have_content("Price: #{grocery1.price}")
    expect(page).to have_content(grocery1.in_stock)
    expect(page).to have_content(grocery2.name)
    expect(page).to have_content("Price: #{grocery2.price}")
    expect(page).to have_content(grocery2.in_stock)
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

    visit "/grocery_stores/#{store1.id}/groceries"
    
    click_link('Go to HomePage')
    expect(current_path).to eq('/')
  end

  it 'can take the user to the Grocery Store page' do 
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

    visit "/grocery_stores/#{store1.id}/groceries"
  
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
