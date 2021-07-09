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

  it 'can take the user to the home page' do 
    dealer1 = Dealership.create!(name: 'Dealer1', 
                                  address: '4200 high st', 
                                  open_weekends: true, 
                                  years_open: 42
                                )

    dealer2 = Dealership.create!(name: 'Dealer2', 
                                address: '6925 ride st', 
                                open_weekends: false, 
                                years_open: 23
                                )

    visit "/dealerships/#{dealer1.id}"
    
    click_link('Go to HomePage')
    expect(current_path).to eq('/')
  end
  
  it 'can take the user to the cars page' do 
    dealer1 = Dealership.create!(name: 'Dealer1', 
                                  address: '4200 high st', 
                                  open_weekends: true, 
                                  years_open: 42
                                )

    dealer2 = Dealership.create!(name: 'Dealer2', 
                                address: '6925 ride st', 
                                open_weekends: false, 
                                years_open: 23
                                )

    visit "/dealerships/#{dealer1.id}"

    click_link('Go to Cars')
    expect(current_path).to eq('/cars')
  end 
end 