require 'rails_helper'

describe 'Cars index page' do 
  it 'can see all cars models and make' do 
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

    r8 = dealer1.cars.create!(model: 'R8', 
                                make: 'Audi', 
                                year: 2022, 
                                under_100k_miles: true
                              )   
    
    visit '/cars'
    
    expect(page).to have_content(lambo.make)
    expect(page).to have_content("Year: #{lambo.year}")
    expect(page).to have_content(r8.model)
    expect(page).to have_content("Year: #{r8.year}")
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

    visit '/cars'
    
    click_link('Go to HomePage')
    expect(current_path).to eq('/')
  end 

  it 'can take the user to the dealership page' do 
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

    visit '/cars'
  
    click_link('Go to Dealerships')
    expect(current_path).to eq('/dealerships')
  end 

end 
