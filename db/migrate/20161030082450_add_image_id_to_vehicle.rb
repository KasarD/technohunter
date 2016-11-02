class AddImageIdToVehicle < ActiveRecord::Migration

  add_column(:vehicle_images, :vehicle_id, :integer)

end
