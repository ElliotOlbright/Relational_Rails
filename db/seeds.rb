# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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