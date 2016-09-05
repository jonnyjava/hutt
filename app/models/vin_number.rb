class VinNumber < ActiveRecord::Base
  has_many :properties

  def self.find_or_create_by_vin_number(vin)
    vin_number = VinNumber.where(vin: vin)
puts "-------------------------1"
    if !vin_number.present?
puts "-------------------------2"
      vin_number = self.create!(vin: vin)
puts "-------------------------3"
      properties = self.get_from_outside(vin)
puts "-------------------------4"
      Property.save_list(vin_number.id, properties)
puts "-------------------------5"
    end
puts "-------------------------6"
    vin_number
  end

  private

  def self.get_from_outside(vin)
    scrapper = VinScrapper.new()
    scrapper.vin_number = vin
    scrapper.read
  end
end
