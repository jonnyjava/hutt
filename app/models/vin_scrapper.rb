$LOAD_PATH << '.'

require "capybara"
require 'capybara/poltergeist'
require "capybara/dsl"
require "launchy"

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false)
end

Capybara.configure do |config|
  config.run_server = false
  config.current_driver = :poltergeist
end

class VinScrapper
  include Capybara::DSL

  attr_accessor :vin_number, :car_info

  def initialize
    Napa::Logger.logger.debug '----------initialize'
    @car_info = []
  end

  def read
    Napa::Logger.logger.debug '----------read'
    prepare_page(vin_number)
    scrap_page(vin_number)
    @car_info
    #debug
  end

  private

  def prepare_page(vin_number)
    Napa::Logger.logger.debug '----------prepare_page(vin_number)'
    visit('http://en.vindecoder.pl/')
    vin_field = find(:xpath, '//*[@id="vin"]')
    button = find(:xpath, '//*[@id="vindecoder"]/button')
    fill_in 'vin', with: vin_number
    page.execute_script "document.forms[0].submit();"
  end

  def scrap_page(vin_number)
    Napa::Logger.logger.debug '----------scrap_page(vin_number)'
    visit("http://en.vindecoder.pl/#{vin_number}")
    tables = find_all('html body div.container div.row div.col-sm-8 div.row div.col-md-12 div.panel.panel-default table.table.table-striped.table-two-col tbody')
    tables.each do |table|
      trs = table.find_all('tr')
      trs.each do |tr|
        extract_values(tr)
      end
    end
  end

  def extract_values(tr)
    Napa::Logger.logger.debug '----------extract_values(tr)'
    @car_info << [tr.find('th').text, tr.find('td').text]
  end

  def debug
    Napa::Logger.logger.debug '----------debug'
    @car_info = [["Entered VIN", "WDD2073221F053316"], ["Corrected VIN", "WDD2073221F053316"], ["Squish VIN", "WDD207321F"], ["WMI", "WDD"], ["VIS identifier", "N/A"], ["VDS", "2073221F"], ["Year identifier", "1"], ["Serial number", "053316"], ["VIN type", "normal"], ["Check digit", "not valid"], ["Make", "Mercedes-Benz"], ["Model", "E 350 CDI"], ["Model year", "2010"], ["Trim level", "C207"], ["Body style", "2 Doors Coupe"], ["Engine type", "3.0L V6 DOHC 24V RWD"], ["Fuel type", "Diesel"], ["Transmission", "7-Speed Automatic"], ["Vehicle class", "Executive car"], ["Vehicle type", "Passenger car"], ["Manufactured in", "Germany"], ["Body type", "Coupe"], ["Number of doors", "2"], ["Number of seats", "4"], ["Displacement SI", "2987"], ["Displacement CID", "182"], ["Displacement Nominal", "3.0"], ["Engine type", "V6"], ["Engine head", "DOHC"], ["Engine valves", "24"], ["Engine cylinders", "6"], ["Engine aspiration", "Turbocharged or Supercharged"], ["Engine HorsePower", "231"], ["Engine KiloWatts", "170"], ["Automatic gearbox", "7AT"], ["Fuel type", "Diesel"], ["Emission standard", "Euro 5"], ["Driveline", "RWD"], ["Anti-Brake System", "ABS"]]
  end
end
