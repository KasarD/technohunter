# encoding: utf-8 
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 Car.create([{ vehicle_type: "Седан", description: "Тестовая машина", moderate: true, price: 3000, kpp: "Механика", year: "2008", engine: "Бензин", engine_cap: "1.6" },
            { vehicle_type: "Хэтчбэк", description: "Вторая тестовая машина", moderate: true, price: 8000, kpp: "Автомат"}
 ])

 Equip.create([{ vehicle_type: "Фрезерный станок", description: "Теcтовое оборудование", moderate: true, price: 107700, year: "2001" },
             { vehicle_type: "Токарный станок", description: "Теcтовое оборудование", moderate: true, price: 154000, year: "2007"}
 ])

  Truck.create([{ vehicle_type: "Седан", description: "Тестовая машина", moderate: true, price: 3000, kpp: "Механика" },
            { vehicle_type: "Хэтчбэк", description: "Вторая тестовая машина", moderate: true, price: 8000, kpp: "Автомат"}
 ])