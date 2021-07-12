require 'rails_helper'

describe 'Grocery Store creation page' do 
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
      open_24_hours: false
    )
    visit "/grocery_stores/new"
    
    store2 = GroceryStore.create!(
      name: 'Stater Bros', 
      address: '2345 Chump Boulevard', 
      open_24_hours: true
    )
    click_button('Create Store')
    
    expect(current_path).to eq('/grocery_stores')
    expect(page).to have_content('Grocery Stores Index')
    expect(page).to have_content('Stater Bros')
  end 
end 
