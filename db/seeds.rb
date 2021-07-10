#Dealership and Cars Seed
Car.destroy_all
Dealership.destroy_all

dealer1 = Dealership.create!(name: 'Lit Motors', address: '4200 high st', open_weekends: true, years_open: 42)
dealer2 = Dealership.create!(name: 'Elways Dealership', address: '1234 fake st', open_weekends: true, years_open: 12)
dealer3 = Dealership.create!(name: 'Sweet Rides', address: '6943 date st', open_weekends: false, years_open: 69)
dealer4 = Dealership.create!(name: 'Sick Cruises', address: '2020 corona blvd', open_weekends: false, years_open: 20)
dealer5 = Dealership.create!(name: 'White House Dealers', address: '1600 pennsylvania ave', open_weekends: true, years_open: 16)
dealer6 = Dealership.create!(name: 'Could be motors', address: '5050 chance cr', open_weekends: false, years_open: 50)

dealer1.cars.create!(model: 'WRX', make: 'Subaru', year: 2013, under_100k_miles: true)
dealer1.cars.create!(model: 'Outback', make: 'Subaru', year: 1998, under_100k_miles: false)
dealer1.cars.create!(model: 'Forester', make: 'Subaru', year: 2002, under_100k_miles: false)
dealer1.cars.create!(model: 'impreza', make: 'Subaru', year: 2012, under_100k_miles: true)

dealer2.cars.create!(model: 'MDX', make: 'Acura', year: 2006, under_100k_miles: false)
dealer2.cars.create!(model: 'MLR', make: 'Acura', year: 1989, under_100k_miles: true)
dealer2.cars.create!(model: 'TLX', make: 'Acura', year: 2009, under_100k_miles: true)
dealer2.cars.create!(model: 'RLX', make: 'Acura', year: 2001, under_100k_miles: true)

dealer3.cars.create!(model: 'x1', make: 'BMW', year: 2017, under_100k_miles: true)
dealer3.cars.create!(model: 'm3', make: 'BMW', year: 1987, under_100k_miles: false)
dealer3.cars.create!(model: '325i', make: 'BMW', year: 1992, under_100k_miles: false)
dealer3.cars.create!(model: 'Z4', make: 'BMW', year: 2013, under_100k_miles: true)

dealer4.cars.create!(model: 'a7', make: 'Audi', year: 2009, under_100k_miles: true)
dealer4.cars.create!(model: 'r8', make: 'Audi', year: 2019, under_100k_miles: true)
dealer4.cars.create!(model: 'q3', make: 'Audi', year: 2009, under_100k_miles: false)
dealer4.cars.create!(model: 'a3', make: 'Audi', year: 1999, under_100k_miles: false)

dealer5.cars.create!(model: 'Konna', make: 'Hyundai', year: 2000, under_100k_miles: false)
dealer5.cars.create!(model: 'Accent', make: 'Hyundai', year: 2015, under_100k_miles: true)
dealer5.cars.create!(model: 'Sante Fe', make: 'Hyundai', year: 2006, under_100k_miles: true)
dealer5.cars.create!(model: 'Sonata', make: 'Hyundai', year: 2003, under_100k_miles: false)

dealer6.cars.create!(model: 'model s', make: 'Tesla', year: 2012, under_100k_miles: true)
dealer6.cars.create!(model: 'cybertruck', make: 'Tesla', year: 2022, under_100k_miles: true)
dealer6.cars.create!(model: 'model 3', make: 'Tesla', year: 2016, under_100k_miles: true)
dealer6.cars.create!(model: 'model x', make: 'Tesla', year: 2013, under_100k_miles: false)

#Grocery Store and Groceries Seed
Grocery.destroy_all
GroceryStore.destroy_all

albertsons = GroceryStore.create!(name: 'Albertsons', address: '1234 Fake Street', open_24_hours: false)
stater_bros = GroceryStore.create!(name: 'Stater Bros', address: '2345 Chump Boulevard', open_24_hours: true)
vons = GroceryStore.create!(name: 'Vons', address: '3456 What Way', open_24_hours: false)
cvs = GroceryStore.create!(name: 'CVS', address: '4567 Woke Place', open_24_hours: true)
rite_aid = GroceryStore.create!(name: 'Rite Aid', address: '5678 Banana Avenue', open_24_hours: false)
food_4_less = GroceryStore.create!(name: 'Food 4 Less', address: '6789 Cow Circle', open_24_hours: true)

albertsons.groceries.create!(name: 'Fishy Bits', price: 7.99, in_stock: true)
albertsons.groceries.create!(name: 'Cheese Sticks', price: 9.99, in_stock: false)

stater_bros.groceries.create!(name: 'Chicky Tendies', price: 12.99, in_stock: true)
stater_bros.groceries.create!(name: 'Wonder Bread', price: 4.5, in_stock: false)

vons.groceries.create!(name: 'Bananas', price: 2.79, in_stock: true)
vons.groceries.create!(name: 'Bacon', price: 10.0, in_stock: false)

cvs.groceries.create!(name: 'Peanut Butter', price: 6.99, in_stock: true)
cvs.groceries.create!(name: 'Happy Apples', price: 6.78, in_stock: false)

rite_aid.groceries.create!(name: 'Guacamole', price: 8.0, in_stock: true)
rite_aid.groceries.create!(name: 'Beans', price: 2.5, in_stock: false)

food_4_less.groceries.create!(name: 'Doritos', price: 5.0, in_stock: true)
food_4_less.groceries.create!(name: 'Tofu', price: 9.45, in_stock: false)

