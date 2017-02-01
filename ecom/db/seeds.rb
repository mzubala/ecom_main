# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

Spree::User.first.update(spree_api_key: '111222333444555666777888999')

Spree::Sample.load_sample("payment_methods")
Spree::Sample.load_sample("shipping_categories")
Spree::Sample.load_sample("shipping_methods")
Spree::Sample.load_sample("tax_categories")
Spree::Sample.load_sample("tax_rates")


country = Spree::Country.find_by(iso: 'US')
location = Spree::StockLocation.first_or_create!(name: 'default',
  address1: 'Example Street',
  city: 'City',
  zipcode: '12345',
  country: country,
  state: country.states.first)
location.active = true
location.save!


