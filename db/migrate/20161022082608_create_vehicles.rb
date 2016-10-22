class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string  :type, null: false, default: "-"
      t.string  :vehicle_type, null: false
      # Пропущены поля модели и брэнда
      t.string  :body, null: false, default: "-"
      t.text    :description, null: true
      t.string  :engine, null: false, default: "-", limit: 10
      t.string  :engine_cap, null: false, default: "0", limit: 5
      # Paperclip fields
      t.string  :kpp, null: false, default: "-"
      t.boolean :moderate, null: false, default: false
      t.integer :vehicle_status, null: false, default: 1
      t.decimal :price, null: false, default: 0, precision: 14 ,scale: 2
      t.string  :drive, null: false, default: "-"
      t.integer :mileage, null: false, default: 0
      # Пропущены поля города и региона
      t.integer :status, null: false, default: "-"
      # Пропущено поле id пользователя
      t.string  :vin_code, null: false, default: "-"
      t.string  :year, null: false, default: "-", limit: 4
      t.integer :h_of_use, null: false, default: "0"

      t.timestamps null: false
    end
  end
end
