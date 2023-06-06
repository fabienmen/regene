class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :land, null: false, foreign_key: true
      t.boolean :active
      t.references :earning, null: false, foreign_key: true

      t.timestamps
    end
  end
end
