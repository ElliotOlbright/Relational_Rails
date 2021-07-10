require 'rails_helper'

describe 'Dealership Cars page' do 
  it 'can see all dealership cars make and year' do 
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
    
    visit "/dealerships/#{dealer1.id}/cars"
    
    expect(page).to have_content("#{dealer1.name}")
    expect(page).to have_content("Model: #{lambo.model}")
    expect(page).to have_content(lambo.make)
    expect(page).to have_content("Model: #{r8.model}")
    expect(page).to have_content(r8.make)
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

  visit "/dealerships/#{dealer1.id}/cars"
      
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

    visit "/dealerships/#{dealer1.id}/cars"
      
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

    visit "/dealerships/#{dealer1.id}/cars"
      
        click_link('Go to Cars')
        expect(current_path).to eq('/cars')
  end 

  it 'can take the user dealership lot' do 
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

    visit "/dealerships/#{dealer1.id}"

    expect(current_path).to eq("/dealerships/#{dealer1.id}")

    click_link('Go to Lot')
    expect(current_path).to eq("/dealerships/#{dealer1.id}/cars")
    expect(page).to have_content(lambo.model)
  end 

  it 'can take the user to edit a dealership' do 
    dealer1 = Dealership.create!(name: 'Dealer1', 
                                  address: '4200 high st', 
                                  open_weekends: true, 
                                  years_open: 42
                                )

    visit "/dealerships/#{dealer1.id}"

    expect(current_path).to eq("/dealerships/#{dealer1.id}")


    click_link('Edit Dealership')
    expect(current_path).to eq("/dealerships/#{dealer1.id}/edit")
  end 

  it 'can take the user to delete a dealership' do 
    dealer1 = Dealership.create!(name: 'Dealer1', 
                                  address: '4200 high st', 
                                  open_weekends: true, 
                                  years_open: 42
                                )

    visit "/dealerships/#{dealer1.id}"

    expect(current_path).to eq("/dealerships/#{dealer1.id}")

    click_link('Delete Dealership')
    expect(current_path).to eq('/dealerships')
    expect(page).to have_no_content(dealer1.name)
  end 

  it 'can take the user to edit a dealership' do 
    dealer1 = Dealership.create!(name: 'Dealer1', 
                                  address: '4200 high st', 
                                  open_weekends: true, 
                                  years_open: 42
                                )

    visit "/dealerships/#{dealer1.id}"

    expect(current_path).to eq("/dealerships/#{dealer1.id}")


    click_link('Edit Dealership')
    expect(current_path).to eq("/dealerships/#{dealer1.id}/edit")
  end 

  it 'can take the user to add a car to the lot' do 
    dealer1 = Dealership.create!(name: 'Dealer1', 
                                  address: '4200 high st', 
                                  open_weekends: true, 
                                  years_open: 42
                                )

    visit "/dealerships/#{dealer1.id}"

    expect(current_path).to eq("/dealerships/#{dealer1.id}")


    click_link('Edit Dealership')
    expect(current_path).to eq("/dealerships/#{dealer1.id}/edit")
  end 
end 
