class ApplicationApi < Grape::API
  format :json
  extend Napa::GrapeExtenders

  mount VinNumbersApi => '/vin_number'

  add_swagger_documentation
end

