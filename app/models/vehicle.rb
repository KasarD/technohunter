class Vehicle < ActiveRecord::Base
    belongs_to :city
    belongs_to :region

    validates :vehicle_type, :status, presence: true
    validates :year, length: { is: 4 }, presence: true
    validates :price, presence: true
    validate  :price_cannot_be_negative, 
              :price_cannot_be_greater_999999999999
    validates :city_id, :region_id, presence: true
    validates :vin_code, numericality: true

    # Блок самописных валидаций
    def price_cannot_be_negative
        if !price.nil?
            errors.add(:price, "can not be negative") if 
                price < 0
        end
    end

    def price_cannot_be_greater_999999999999
        if !price.nil? 
            errors.add(:price, "is too big!") if
                price > 999999999999
        end
    end
    #######-------------------------#######   
end
