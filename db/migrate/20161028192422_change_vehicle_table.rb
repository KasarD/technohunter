class ChangeVehicleTable < ActiveRecord::Migration
  change_table :vehicles do |t|
    t.change :price, :decimal, null: true, default: false
  end
end
