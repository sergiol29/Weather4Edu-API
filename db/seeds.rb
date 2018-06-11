# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: 'Sergio Lopez', email: 'lopezsergio@correo.ugr.es', password: '12345678', company: 'TFG')
Station.create!(user_id: 1, name: 'Stations', code: 'a0:20:a6:1b:da:ac', latitude: 37.159438000000, longitude: -3.605500000000)
Variable.create!(code: 'DWP', name: 'Test', symbol: '%')
Variable.create!(code: 'VEL', name: 'Velocidad', symbol: 'km/h')
