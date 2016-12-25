class AddCityAndRegionToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :city_id, :integer
    add_column :vehicles, :region_id, :integer
  end
end
