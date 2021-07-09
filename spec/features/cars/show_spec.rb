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

  it 'can take the user to the home page' do 
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
      
      click_link('Go to HomePage')
      expect(current_path).to eq('/')
    end 

  it 'can take the user to the dealership page' do 
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
      
        click_link('Go to Dealerships')
        expect(current_path).to eq('/dealerships')
  end 

  it 'can take the user to the car page' do 
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
      
        click_link('Go to Cars')
        expect(current_path).to eq('/cars')
  end 
end 