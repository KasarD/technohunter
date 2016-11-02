FactoryGirl.define do
    factory :region do |f|
        f.name "Московский"
    end

    factory :city do |f|
        f.name "Москва"
        f.association :region, factory: :region 
    end
    
    factory :vehicle do |f|
        f.vehicle_type "test"
        f.year         "1997"
        f.price        29000
        f.city_id      1
        f.region_id    2
    end

    factory :car do |car|
        car.vehicle_type "Седан"
        car.description  "Тестовое описание"
        car.engine       "Бензин"
        car.engine_cap   "1.6"
        car.kpp          "Механика"
        car.moderate     true
        car.price        780000
        car.drive        "Передний"
        car.mileage      500
        car.vin_code     "1234554321"
        car.year         2007
        car.association  :region, factory: :region
        car.association  :city, factory: :city      
    end

    factory :invalid_car, parent: :car do |car|
        car.vehicle_type nil
    end

    factory :vehicle_image do |f|
        f.photo { File.new("#{Rails.root}/spec/support/1.jpg") }
    end

    factory :truck do |truck|
        truck.vehicle_type "Тягач"
        truck.description "Тестовый тягач"
        truck.engine "Дизель"
        truck.engine_cap "6"
        truck.moderate true
        truck.status "1"
        truck.mileage 100000
        truck.year 2002
        truck.vin_code 11111111111
        truck.h_of_use 700
        truck.price 2000000
        truck.association :region, factory: :region
        truck.association :city, factory: :city
    end

    factory :invalid_truck, parent: :truck do |truck|
        truck.vehicle_type nil
    end

    factory :equip do |equip|
        equip.vehicle_type "Токарный станок"
        equip.description "Тестовый станок"
        equip.moderate true
        equip.status "1"
        equip.year 2005
        equip.vin_code 11111111111
        equip.h_of_use 7000
        equip.price 1200000
    end

    factory :invalid_equip, parent: :equip do |equip|
        equip.vehicle_type nil
    end
end