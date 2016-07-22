ActiveRecord::Schema.define(version: 20160722213819) do

  enable_extension "plpgsql"

  create_table "vin_numbers", force: :cascade do |t|
    t.string   "vin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
