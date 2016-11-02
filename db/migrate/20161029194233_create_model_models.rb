class CreateModelModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :name
      t.string :type
      t.integer :brand_id
    end
  end
end
