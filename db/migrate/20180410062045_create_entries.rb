class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :zip
      t.integer :humidity
      t.string :wind_direction
      t.float :wind_speed
      t.float :temp
      t.integer :pressure
      t.string :description
      t.string :city

      t.timestamps
    end
  end
end
