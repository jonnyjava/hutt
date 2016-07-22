class CreateVinNumbers < ActiveRecord::Migration
  def change
    create_table :vin_numbers do |t|
      t.string :vin

      t.timestamps
    end
  end
end