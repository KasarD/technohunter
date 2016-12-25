# Модкль города (для выбора в объявлении)
class City < ActiveRecord::Base
  belongs_to :region
end
