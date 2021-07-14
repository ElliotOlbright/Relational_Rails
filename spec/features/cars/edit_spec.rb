require 'rails_helper'

describe 'Cars Edit page' do 
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

    visit "/cars/#{@lambo.id}/edit"
  end
  
  it 'can see Update car form' do 

    expect(page).to have_content("Update #{@lambo.make}")

    expect(page).to have_field("Model of Your Car (#{@lambo.model})")
    expect(page).to have_field("Make of your Car (#{@lambo.make})")
    expect(page).to have_field("Year of your car (#{@lambo.year})")
    expect(page).to have_field("Under 100k Miles (#{@lambo.under_100k_miles})")
  end 

  it 'can see fill in Car edit form' do 

    fill_in :model, with: "Example Model"
    fill_in :make, with: "Example Make"
    fill_in :year, with: "2012"
    fill_in :under_100k_miles, with: "true"

    click_button('Update')

    expect(current_path).to eq("/cars/#{@lambo.id}")
    expect(page).to have_content("Model: Example Model")
    expect(page).to have_content("Make: Example Make")
    expect(page).to have_content("Year: 2012")
  end 

  it 'can ignore blanks in Car edit form' do 

    fill_in :model, with: ""
    fill_in :make, with: ""
    fill_in :year, with: ""
    fill_in :under_100k_miles, with: ""

    click_button('Update')

    expect(current_path).to eq("/cars/#{@lambo.id}")
    expect(page).to have_content("Model: #{@lambo.model}")
    expect(page).to have_content("Make: #{@lambo.make}")
    expect(page).to have_content("Year: #{@lambo.year}")
  end 
end 

