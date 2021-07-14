require 'rails_helper'

describe 'Dealerships show page' do 
  before :each do 
    @dealer1 = Dealership.create!(name: 'Dealer1', 
                                address: '4200 high st', 
                                open_weekends: true, 
                                years_open: 42
                              )

    @dealer2 = Dealership.create!(name: 'Dealer2', 
                                address: '6925 ride st', 
                                open_weekends: false, 
                                years_open: 23
                                )
    @lambo = @dealer1.cars.create!(model: 'diablo', 
                                  make: 'Lamborghini', 
                                  year: 2020, 
                                  under_100k_miles: true
                                )
    
    @r8 = @dealer1.cars.create!(model: 'R8', 
                                make: 'Audi', 
                                year: 2022, 
                                under_100k_miles: true
                              )   

    visit "/dealerships/#{@dealer1.id}"
  end

  it 'can see all dealerships name and address' do 
    expect(page).to have_content(@dealer1.name)
    expect(page).to have_content("Address: #{@dealer1.address}")
  end

  it 'can take the user to the home page' do 
    click_link('Go to HomePage')
    expect(current_path).to eq('/')
  end
  
  it 'can take the user to the cars page' do 
    click_link('Go to Cars')
    expect(current_path).to eq('/cars')
  end 

  it 'can display the amount of cars on lot' do 
    expect(page).to have_content("Inventory: #{@dealer1.car_count} cars on lot")
  end 

  it 'can take the user to the dealers lot' do 
    click_link('Go to Lot')
    expect(current_path).to eq("/dealerships/#{@dealer1.id}/cars")
  end
end 

describe 'Dealerships show page CRUD' do 
  before :each do 
    @dealer1 = Dealership.create!(name: 'Dealer1', 
                                address: '4200 high st', 
                                open_weekends: true, 
                                years_open: 42
                              )
    visit '/dealerships'
  end 
  it 'can take the user to edit a dealership' do

    click_link('Edit Dealership')
    expect(current_path).to eq("/dealerships/#{@dealer1.id}/edit")
  end 

  it 'can take the user to delete a dealership' do 

    click_link('Delete Dealership')
    expect(current_path).to eq('/dealerships')
    expect(page).to have_no_content(@dealer1.name)
  end 

  it 'can take the user to create a new dealership' do 

    click_link('New Dealership')
    expect(current_path).to eq('/dealerships/new')
    expect(page).to have_content('Add a Dealership')
  end 
end 