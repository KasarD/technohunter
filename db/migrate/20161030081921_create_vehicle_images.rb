class CreateVehicleImages < ActiveRecord::Migration
  def change
    create_table :vehicle_images do |t|
      t.attachment :photo
    end
  end
end
