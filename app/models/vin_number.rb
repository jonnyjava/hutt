class VinNumber < ActiveRecord::Base
  has_many :properties

  def self.find_or_create_by_vin_number(vin)
    vin_number = VinNumber.where(vin: vin)
    if !vin_number.present?
      vin_number = self.create!(vin: vin)
      properties = self.get_from_outside(vin)
      Property.save_list(vin_number.id, properties)
    end
    vin_number
  end

  private

  def self.get_from_outside(vin)
    scrapper = VinScrapper.new()
    scrapper.vin_number = vin
    scrapper.read
  end
end
