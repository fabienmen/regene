class CreateEarnings < ActiveRecord::Migration[7.0]
  def change
    create_table :earnings do |t|
      t.float :year_1
      t.float :year_2
      t.float :year_3
      t.float :year_4
      t.float :year_5
      t.float :year_6
      t.float :year_7
      t.float :year_8
      t.float :year_9
      t.float :year_10
      t.float :year_11
      t.float :year_12
      t.float :year_13
      t.float :year_14
      t.float :year_15
      t.float :year_16
      t.float :year_17
      t.float :year_18
      t.float :year_19
      t.float :year_20
      t.float :year_21
      t.float :year_22
      t.float :year_23
      t.float :year_24
      t.float :year_25
      t.float :year_26
      t.float :year_27
      t.float :year_28
      t.float :year_29
      t.float :year_30
     
      t.timestamps
    end
  end
end
