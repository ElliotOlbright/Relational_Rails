require 'rails_helper'

describe 'Dealerships index page' do 
  it 'can see all dealership names' do 
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
    
    visit '/dealerships'

    expect(page).to have_content(dealer1.name)
    expect(page).to have_content(dealer2.name)
    
  end 
end 
