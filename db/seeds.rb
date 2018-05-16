# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding database"
Booking.destroy_all
User.destroy_all
Pool.destroy_all




user_seed = [
  {
  First_Name: "Tim",
  Last_Name: "Almamedov",
  email: "tim.almamedov@gmail.com",
  password: "password",
  password_confirmation: "password",
  Address: '52 rue paradis Marseille',
  Phone_Number: '+33 660 479 42 52',
  },

  {
  First_Name: "Tonton",
  Last_Name: "David",
  email: "tonton.david@gmail.com",
  password: "password",
  password_confirmation: "password",
  Address: 'Lyon',
  Phone_Number: '+33 567 435 41 52',
  },

  {
  First_Name: "Bella",
  Last_Name: "Sirene",
  email: "bella.sirene@gmail.com",
  password: "password",
  password_confirmation: "password",
  Address: '72 rue paradis Marseille',
  Phone_Number: '+33 660 454 42 52',
  }
]

pool_seed = [
  {
  user_id: @user_id.sample,
  description: "Thats a long description",
  dimensions: "5x3",
  price: 100,
  title: "Très belle Piscine",
  address: "52 rue paradis Marseille",
  },

  {
   user_id: @user_id.sample,
  description: "Thats a very long description",
  dimensions: "8x2",
  price: 120,
  title: "Très treès très belle Piscine",
  address: "17 avenue de la resistance Toulon",
  },

  {
  user_id: @user_id.sample,
  description: "je ne sais pas tropo",
  dimensions: "2x2",
  price: 20,
  title: "Très treès très belle Piscine",
  address: "5 rue Pierre Expert Paris",
  },

   {
  user_id: @user_id.sample,
  description: "je ne sais pas tropo",
  dimensions: "10x2",
  price: 80,
  title: "Très treès très belle Piscine",
  address: "La Ciotat",
  },


   {
  user_id: @user_id.sample,
  description: "je ne sais pas tropo",
  dimensions: "6x4",
  price: 30,
  title: "Super belle Piscine",
  address: "Mairie La Ciotat",
  }
]

User.create!(user_seed)
Pool.create!(pool_seed)






Booking.create!(
  date: Date.new(2018,6,20),
  # status: "Pending",
  user_id: @user_id.sample,
  pool_id: 2
  )

Booking.create!(
  date: Date.new(2018,7,20),
  # status: "Pending",
  user_id: @user_id.sample,
  pool_id: 3
  )

Booking.create!(
  date: Date.new(2018,9,20),
  # status: "Pending",
  user_id: @user_id.sample,
  pool_id: 3
  )

puts "Seeding done"
