require 'rails_helper'

describe 'Dealership Add Page' do 
  it 'Can see Add a  Dealership' do 
    
    visit "/dealerships/new"

    expect(page).to have_content('Add a Dealership')
  end 

  it 'Can see Add Dealership Form' do 
  
    visit "/dealerships/new"

    expect(page).to have_field(:name)
    expect(page).to have_field(:address)
    expect(page).to have_field(:open)
    expect(page).to have_field(:years)
  end 

  it 'Can create a new Dealership' do 
  
    visit "/dealerships/new"

    click_button('Create')

    expect(current_path).to eq('/dealerships')
    expect(page).to have_content('Dealership Index')
  end 
end 
