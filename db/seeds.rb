# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database..."
Land.destroy_all
User.destroy_all
Offer.destroy_all

user1 = User.new(email: "t@gmail.com", password: "123123", first_name: "Tiago", last_name: "Andrade", address: "Rua faria da costa", phone_number: "11942483414", tax_number: 65859318073)
user1.save!

puts "Creating lands..."
land3 = Land.new(
  registration_number: "1988",
  total_area: 10,
  latitude: 14.601982,
  longitude: -61.064570,
  address: "rua faria da costa",
  biome: "Amazonica"
)
land3.save!

land2 = Land.new(
  registration_number: "1980",
  total_area: 100,
  latitude: 10.601982,
  longitude: -61.064570,
  address: "rua faria da costa n33",
  biome: "Amazonica"
)
land2.save!

# ola
land1 = Land.new(
  registration_number: "1970",
  total_area: 1,
  latitude: 15.601982,
  longitude: -61.064570,
  address: "rua faria da costa n33 azenhas do mar",
  biome: "Amazonica"
)
land1.save!

puts "Creating earnings..."
earning1 = Earning.new(
  year_1: 75000,
  year_2: 75000,
  year_3: 75000,
  year_4: 75000,
  year_5: 75000,
  year_6: 75000,
  year_7: 75000,
  year_8: 75000,
  year_9: 75000,
  year_10: 75000,
  year_11: 75000,
  year_12: 75000,
  year_13: 75000,
  year_14: 75000,
  year_15: 75000,
  year_16: 75000,
  year_17: 75000,
  year_18: 75000,
  year_19: 75000,
  year_20: 75000,
  year_21: 75000,
  year_22: 75000,
  year_23: 75000,
  year_24: 75000,
  year_25: 75000,
  year_26: 75000,
  year_27: 75000,
  year_28: 75000,
  year_29: 75000,
  year_30: 75000
)

earning1.save!
puts "Creating credits price..."
carbon_credit_price1 = CarbonCreditPrice.new(
  biome_name: "Amazonica",
  year_1: 150,
  year_2: 150,
  year_3: 150,
  year_4: 150,
  year_5: 150,
  year_6: 150,
  year_7: 150,
  year_8: 150,
  year_9: 150,
  year_10: 150,
  year_11: 150,
  year_12: 150,
  year_13: 150,
  year_14: 150,
  year_15: 150,
  year_16: 150,
  year_17: 150,
  year_18: 150,
  year_19: 150,
  year_20: 150,
  year_21: 150,
  year_22: 150,
  year_23: 150,
  year_24: 150,
  year_25: 150,
  year_26: 150,
  year_27: 150,
  year_28: 150,
  year_29: 150,
  year_30: 150,
  earning_id: 1
)

carbon_credit_price1.save!
puts "Creating credits per ha..."
credit_per_ha1 = CreditPerHa.new(
  bione_name: "Amazonica",
  year_1: 6,
  year_2: 6,
  year_3: 6,
  year_4: 6,
  year_5: 6,
  year_6: 6,
  year_7: 6,
  year_8: 6,
  year_9: 6,
  year_10: 6,
  year_11: 6,
  year_12: 6,
  year_13: 6,
  year_14: 6,
  year_15: 6,
  year_16: 6,
  year_17: 6,
  year_18: 6,
  year_19: 6,
  year_20: 6,
  year_21: 6,
  year_22: 6,
  year_23: 6,
  year_24: 6,
  year_25: 6,
  year_26: 6,
  year_27: 6,
  year_28: 6,
  year_29: 6,
  year_30: 6,
  earning_id: 1
)


credit_per_ha1.save!
puts "Creating offers..."
offer1 = Offer.new(
  user: user1,
  land: land1,
  active: false,
  earning: earning1,
  replanted_area: 100
)
offer1.save!
