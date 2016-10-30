require 'rails_helper'

describe Truck do

    it "has a valid factory" do
        expect(create(:truck)).to be_valid
    end

    it "is invalid without a vehicle type" do
        truck = build(:truck, vehicle_type: nil)
        expect(truck).to_not be_valid
    end

    it "is invalid without city" do
        truck = build(:truck, city_id: nil)
        expect(truck).to_not be_valid
    end

    it "is invalid without region" do
        truck = build(:truck, region_id: nil)
        expect(truck).to_not be_valid
    end

    it "is invalid without engine" do
        truck = build(:truck, engine: nil)
        expect(truck).to_not be_valid
    end

    it "is invalid without price" do
        truck = build(:truck, price: nil)
        expect(truck).to_not be_valid
    end

    describe "price" do
        it "is a decimal value" do
            truck = build(:truck, price: 200000)
            expect(truck.price).to eq(200000.0)
        end
        it "is not be negative" do
            truck = build(:truck, price: -1)
            expect(truck).to_not be_valid
        end
        it "is not be greater than 999999999999" do
            truck = build(:truck, price: 1000000000000)
            expect(truck).to_not be_valid
        end
    end

    describe "engine capacity" do
        it "has length < 4 symb." do
            truck = build(:truck, engine_cap: "1234")
            expect(truck).to_not be_valid
        end 
        it "is only numerical" do
            truck = build(:truck, engine_cap: "aff")
            expect(truck).to_not be_valid
        end
    end

    it "is invalid without status" do
        truck = build(:truck, status: nil)
        expect(truck).to_not be_valid
    end

    it "is invalid without year" do
        truck = build(:truck, year: nil)
        expect(truck).to_not be_valid
    end

    describe "year" do

        it "is invalid with length > 4 symb" do
            truck = build(:truck, year: "12345")
            expect(truck).to_not be_valid
        end
        it "is invalid with length < 4 symb" do
            truck = build(:truck, year: "123")
            expect(truck).to_not be_valid
        end
    end

    describe "vin code" do
        it "is only numerical string" do
            car = build(:car, vin_code: "sfsf11231")
            expect(car).to_not be_valid
        end
    end
end