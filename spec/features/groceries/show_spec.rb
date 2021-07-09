require 'rails_helper'

describe 'Groceries page' do 
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

    visit '/groceries'
    
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

    visit '/groceries'
  
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