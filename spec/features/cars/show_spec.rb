require 'rails_helper'

describe 'Cars page' do 
  it 'can see all cars make and year' do 
    dealer1 = Dealership.create!(name: 'Dealer1', 
                                address: '4200 high st', 
                                open_weekends: true, 
                                years_open: 42
                              )

    lambo = dealer1.cars.create!(model: 'diablo', 
                                make: 'Lamborghini', 
                                year: 2020, 
                                under_100k_miles: true
                              )
    
    visit "/cars/#{lambo.id}"
    expect(page).to have_content(lambo.make)
    expect(page).to have_content("Year: #{lambo.year}")
  end 
end 