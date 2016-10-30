require 'rails_helper'

describe Car do

    it "has a valid factory" do
        expect(create(:car)).to be_valid
    end

    it "is invalid without a vehicle type" do
        car = build(:car, vehicle_type: nil)
        expect(car).to_not be_valid
    end
    
    it "is invalid without drive" do
        car = build(:car, drive: nil)
        expect(car).to_not be_valid
    end

    it "is invalid without body" do
        car = build(:car, body: nil)
        expect(car).to_not be_valid
    end
    it "is invalid without engine" do
        car = build(:car, body: nil)
        expect(car).to_not be_valid
    end

    it "is invalid without city" do
        car = build(:car, city: nil)
        expect(car).to_not be_valid
    end

    it "is invalid without region" do
        car = build(:car, region: nil)
        expect(car).to_not be_valid
    end

    it "is invalid without price" do
        car = build(:car, price: nil)
        expect(car).to_not be_valid
    end

    describe "price" do
        it "is a decimal value" do
            car = build(:car, price: 200000)
            expect(car.price).to eq(200000.0)
        end
        it "is not be negative" do
            car = build(:car, price: -1)
            expect(car).to_not be_valid
        end
        it "is not be greater than 999999999999" do
            car = build(:car, price: 1000000000000)
            expect(car).to_not be_valid
        end
    end

    describe "engine capacity" do
        it "has length < 4 symb." do
            car = build(:car, engine_cap: "1234")
            expect(car).to_not be_valid
        end 
        it "is only numerical" do
            car = build(:car, engine_cap: "aff")
            expect(car).to_not be_valid
        end
    end

    it "is invalid without kpp" do
        car = build(:car, kpp: nil)
        expect(car).to_not be_valid
    end

    it "is invalid without status" do
        car = build(:car, status: nil)
        expect(car).to_not be_valid
    end

    it "is invalid without year" do
        car = build(:car, year: nil)
        expect(car).to_not be_valid
    end

    describe "year" do

        it "is invalid with length > 4 symb" do
            car = build(:car, year: "12345")
            expect(car).to_not be_valid
        end
        it "is invalid with length < 4 symb" do
            car = build(:car, year: "123")
            expect(car).to_not be_valid
        end
    end

    describe "vin code" do
        it "is only numerical string" do
            car = build(:car, vin_code: "sfsf11231")
            expect(car).to_not be_valid
        end
    end
end