# Модель для организации загрузки нескольких фото к одному
# объявлению с помошью gem'a Paperclip
class VehicleImage < ActiveRecord::Base
  belongs_to :vehicle

  Paperclip.interpolates :vehicle_id do |attachment, _style|
    attachment.instance.vehicle_id
  end

  has_attached_file :photo, styles: { normal: '600x600>', thumb: '150x150>' },
                            path: "#{Rails.root}/public/images/:vehicle_id/:style/:filename",
                            url:  '/images/:vehicle_id/:style/:filename'

  do_not_validate_attachment_file_type :photo
end
