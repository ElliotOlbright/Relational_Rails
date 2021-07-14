require 'rails_helper'

describe 'Dealership Edit page' do 
  before :each do
    @dealer1 = Dealership.create!(name: 'Dealer1', 
                                  address: '4200 high st', 
                                  open_weekends: true, 
                                  years_open: 42
                                )

    @lambo = @dealer1.cars.create!(model: 'diablo', 
                                  make: 'Lamborghini', 
                                  year: 2020, 
                                  under_100k_miles: true
                                )

    visit "/dealerships/#{@dealer1.id}/edit"
  end


  it 'can see Update Dealership form' do 

    expect(page).to have_content("Update #{@dealer1.name}")
    expect(page).to have_field(:name)
    expect(page).to have_field(:address)
    expect(page).to have_field(:years_open)
    expect(page).to have_field(:open_weekends)
  end 

  it 'can update in Dealership form' do 

    fill_in :name, with: "Example Name"
    fill_in :address, with: "Example Address"
    fill_in :open_weekends, with: "true"
    fill_in :years_open, with: "2314"

    click_button('Update')

    expect(current_path).to eq("/dealerships/#{@dealer1.id}")
    expect(page).to have_content("Example Name")
    expect(page).to have_content("Example Address")
  end 

  it 'can ignore update in Dealership form' do 

    fill_in :name, with: ""
    fill_in :address, with: ""
    fill_in :open_weekends, with: ""
    fill_in :years_open, with: ""

    click_button('Update')

    expect(current_path).to eq("/dealerships/#{@dealer1.id}")
    expect(page).to have_content("#{@dealer1.name}")
    expect(page).to have_content("#{@dealer1.address}")
  end 
end 
