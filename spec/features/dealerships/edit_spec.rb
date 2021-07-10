require 'rails_helper'

describe 'Dealership Edit page' do 
  it 'can see Update Update Dealership' do 
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
    
    visit "/dealerships/#{dealer1.id}/edit"
    expect(page).to have_content("Update #{dealer1.name}")
  end 

  it 'can see Update Dealership form' do 
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
    
    visit "/dealerships/#{dealer1.id}/edit"
    expect(page).to have_field(:name)
    expect(page).to have_field(:address)
    expect(page).to have_field(:open)
    expect(page).to have_field(:open)
  end 

  it 'can see Update Dealership form' do 
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
    
    visit "/dealerships/#{dealer1.id}/edit"
    fill_in :name, with: "Example User"
    fill_in :address, with: "Example User"
    fill_in :open, with: "true"
    fill_in :years, with: "2314"

    click_button('Update')
    expect(page).to have_content("Dealership Index")
  end 

  it 'can see fill in Dealership form' do 
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
    
    visit "/dealerships/#{dealer1.id}/edit"
    fill_in :name, with: "Example Name"
    fill_in :address, with: "Example Address"
    fill_in :open, with: "true"
    fill_in :years, with: "2314"

    click_button('Update')

    expect(current_path).to eq('/dealerships')
    expect(page).to have_content("Example Name")
    expect(page).to have_content("Example Address")
  end 
end 
