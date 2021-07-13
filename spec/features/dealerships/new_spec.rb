require 'rails_helper'

describe 'Dealership Add Page' do 
  before :each do 
    visit "/dealerships/new"
  end

  it 'Can see Add a  Dealership' do 
    expect(page).to have_content('Add a Dealership')
  end 

  it 'Can see Add Dealership Form' do 
    expect(page).to have_field(:name)
    expect(page).to have_field(:address)
    expect(page).to have_field(:open_weekends)
    expect(page).to have_field(:years_open)
  end 

  it 'Can create a new Dealership' do 
    click_button('Create')

    expect(current_path).to eq('/dealerships')
    expect(page).to have_content('Dealership Index')
  end 
end 
