class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.references :vin_number
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end