class Vehicle < ActiveRecord::Base
    belongs_to :city 
    belongs_to :region
    belongs_to :brand
    belongs_to :model
    has_many   :vehicle_images, dependent: :destroy 

    validates :vehicle_type, :status, presence: true
    validates :year, length: { is: 4 }, presence: true
    validates :price, presence: true
    validate  :price_cannot_be_negative, 
              :price_cannot_be_greater_999999999999
    validates :city_id, :region_id, presence: true
    validates :brand_id, :model_id, presence: true
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
    #######-Конец-#######

    # Процедура по удалению фотографий
    def erase_photos
        # Проверяем, есть ли у объявления фото?
        photo = self.vehicle_images.first
        if photo
            # Если есть, то удаляем по-одному
            self.vehicle_images.each do |p|
                # Необходимо для физ. удаления файлов
                p.photo = nil
                p.save
                p.destroy
            end
            self.save
        end
    end

    # Переопределяем метод для правильного удаления фото
    def destroy
        erase_photos
        super
    end
end
