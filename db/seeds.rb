# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: 'Sergio Lopez', email: 'lopezsergio@correo.ugr.es', password: '12345678', company: 'TFG')
Station.create!(user_id: 1, name: 'Stations', code: 'a0:20:a6:1b:da:ac', latitude: 37.159438000000, longitude: -3.605500000000)
Variable.create!(code: 'FR04', name: 'Lluvia FR04', symbol: '')
Variable.create!(code: 'MQ7', name: 'CO2 MQ7', symbol: '')
Variable.create!(code: 'GUVA_UV', name: 'Rayos UV GUVA', symbol: '')
Variable.create!(code: 'GUVA', name: 'Luz Solar GUVA', symbol: '')
Variable.create!(code: 'TEMP_OBJ_MLX', name: 'Temp Objeto MLX', symbol: 'º')
Variable.create!(code: 'TEMP_AMB_MLX', name: 'Temp Ambiente MLX', symbol: 'º')
Variable.create!(code: 'SW420', name: 'Vibration SW420', symbol: '')
Variable.create!(code: 'HUM_DHT', name: 'Humedad DHT', symbol: '%')
Variable.create!(code: 'TEMP_DHT', name: 'Temperatura DHT', symbol: 'º')
Variable.create!(code: 'BAT', name: 'Bateria', symbol: '%')


