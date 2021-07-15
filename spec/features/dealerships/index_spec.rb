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

    visit '/dealerships'

    expect(current_path).to eq('/dealerships')
    
    click_link('Go to HomePage')
    expect(current_path).to eq('/')
  end 

  it 'can take the user to the car page' do 
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

    expect(current_path).to eq('/dealerships')

    visit '/dealerships'

    click_link('Go to Cars')
    expect(current_path).to eq('/cars')
  end 

  it 'can dislpay newest to oldest' do 
    @dealer1 = Dealership.create!(name: 'Dealer1', 
      address: '4200 high st', 
      open_weekends: true, 
      years_open: 22,
      created_at: 'Tue, 06 Jul 2021 23:41:08 UTC +00:00'
    )

    @dealer2 = Dealership.create!(name: 'Dealer2', 
      address: '6925 ride st', 
      open_weekends: false, 
      years_open: 23,
      created_at: 'Wed, 07 Jul 2021 23:41:08 UTC +00:00'
    )

    @dealer3 = Dealership.create!(name: 'Dealer2', 
      address: '6925 ride st', 
      open_weekends: false, 
      years_open: 41,
      created_at: 'Thu, 08 Jul 2021 18:41:08 UTC +00:00'
    )

    visit '/dealerships'

    within("#dealerships") do 
      
      expect(all("#name")[0].text).to eq(@dealer3.name)
      expect(all("#address")[0].text).to eq(@dealer3.address)
      expect(all("#name")[1].text).to eq(@dealer2.name)
      expect(all("#address")[1].text).to eq(@dealer2.address)
      expect(all("#name")[2].text).to eq(@dealer1.name)
      expect(all("#address")[2].text).to eq(@dealer1.address)
    end 
  end

  it 'can take the user to create a new dealership' do 
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

    expect(current_path).to eq('/dealerships')

    visit '/dealerships'

    click_link('New Dealership')
    expect(current_path).to eq('/dealerships/new')
  end 

  it 'can take the user to edit a dealership' do 
    dealer1 = Dealership.create!(name: 'Dealer1', 
                                  address: '4200 high st', 
                                  open_weekends: true, 
                                  years_open: 42
                                )

    visit '/dealerships'

    expect(current_path).to eq('/dealerships')

    visit '/dealerships'

    click_link('Edit Dealership')
    expect(current_path).to eq("/dealerships/#{dealer1.id}/edit")
  end 

  it 'can take the user to delete a dealership' do 
    dealer1 = Dealership.create!(name: 'Dealer1', 
                                  address: '4200 high st', 
                                  open_weekends: true, 
                                  years_open: 42
                                )

    visit '/dealerships'

    expect(current_path).to eq('/dealerships')

    visit '/dealerships'

    click_link('Delete Dealership')
    expect(current_path).to eq('/dealerships')
    expect(page).to have_no_content(dealer1.name)
  end 

  it 'can take filter Dealerships displayed by user value' do 
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
    fill_in :dealer_name, with: 'Dealer2'

    click_button('Search')

    expect(current_path).to eq('/dealerships')
    expect(page).to have_content(dealer2.name)
  end 

  it 'can take filter Dealerships by cars on lot' do 
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
    dealer3 = Dealership.create!(name: 'Dealer3', 
                                address: '65 small st', 
                                open_weekends: true, 
                                years_open: 12
                              )

    dealer1.cars.create!(model: 'WRX', make: 'Subaru', year: 2013, under_100k_miles: true)
    dealer1.cars.create!(model: 'Outback', make: 'Subaru', year: 1998, under_100k_miles: false)
    dealer1.cars.create!(model: 'Forester', make: 'Subaru', year: 2002, under_100k_miles: false)
    dealer1.cars.create!(model: 'impreza', make: 'Subaru', year: 2012, under_100k_miles: true)
    
    dealer2.cars.create!(model: 'MDX', make: 'Acura', year: 2006, under_100k_miles: false)
    dealer2.cars.create!(model: 'MLR', make: 'Acura', year: 1989, under_100k_miles: true)
    
    dealer3.cars.create!(model: 'x1', make: 'BMW', year: 2017, under_100k_miles: true)
       
    visit '/dealerships'

    within("#dealerships")
    expect(all("#name")[0].text).to eq(dealer3.name)
    expect(all("#name")[1].text).to eq(dealer2.name)
    expect(all("#name")[2].text).to eq(dealer1.name)

    click_link('Sort By Cars On Lot')
   
    expect(current_path).to eq('/dealerships')

    within("#dealerships")
    expect(all("#name")[0].text).to eq(dealer1.name)
    expect(all("#name")[1].text).to eq(dealer2.name)
    expect(all("#name")[2].text).to eq(dealer3.name)
  end 
end 