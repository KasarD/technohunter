class ChangeVehiclePriceColumn < ActiveRecord::Migration
  change_table :vehicles do |t|
    t.change :price, :decimal, default: nil
  end
end
