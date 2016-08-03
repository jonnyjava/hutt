class Property < ActiveRecord::Base

  def self.save_list(vin_number_id, properties)
    properties.each do |property|
      self.create!(vin_number_id: vin_number_id, name: property[0], value: property[1])
    end
  end
end
