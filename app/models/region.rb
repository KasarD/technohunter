# Модель Региона (для выбора в объявлении)
class Region < ActiveRecord::Base
  has_many :cities
end
