require 'rails_helper'

describe 'Dealerships page' do 
  it 'can see all dealerships name and address' do 
    dealer1 = Dealership.create!(name: 'Dealer1', 
                                address: '4200 high st', 
                                open_weekends: true, 
                                years_open: 42
                              )
    
    visit "/dealerships/#{dealer1.id}"
    expect(page).to have_content(dealer1.name)
    expect(page).to have_content("Address: #{dealer1.address}")
  end 
end 