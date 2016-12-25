class AddBrandAndModelToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :model_id, :integer
    add_column :vehicles, :brand_id, :integer
  end
end
