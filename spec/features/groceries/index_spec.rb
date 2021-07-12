require 'rails_helper'

describe 'Groceries index page' do 
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

    grocery2 = store1.groceries.create!(
      name: 'Cheese Sticks', 
      price: 9.99, 
      in_stock: false
    )
    
    visit '/groceries'
    
    expect(page).to have_content(grocery1.name)
    expect(page).to have_content("Price: #{grocery1.price}")
    expect(page).to have_content(grocery1.in_stock)
    expect(page).to have_content(grocery2.name)
    expect(page).to have_content("Price: #{grocery2.price}")
    expect(page).to have_content(grocery2.in_stock)
  end 

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

  xit 'only shows true records' do
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
    visit '/groceries'

    expect(page).to have_content("Fishy Bits")
    expect(page).not_to have_content("Cheese Sticks")
  end
end 
