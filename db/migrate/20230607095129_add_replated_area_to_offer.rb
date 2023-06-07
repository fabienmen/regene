class AddReplatedAreaToOffer < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :replanted_area, :float
  end
end
