class Brand < ActiveRecord::Base
    has_many :models

    def self.get_brands (type)
        Brand.where(type: type)
    end
end
