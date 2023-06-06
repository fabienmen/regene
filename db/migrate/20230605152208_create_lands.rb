class CreateLands < ActiveRecord::Migration[7.0]
  def change
    create_table :lands do |t|
      t.string :registration_number
      t.float :total_area
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :biome

      t.timestamps
    end
  end
end
